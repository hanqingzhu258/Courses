package com.hfut.glxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hfut.glxy.entity.Comment;
import com.hfut.glxy.entity.Student;
import com.hfut.glxy.exception.TransactionalException;
import com.hfut.glxy.mapper.CommentMapper;
import com.hfut.glxy.mapper.StudentMapper;
import com.hfut.glxy.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenliangliang
 * @date: 2017/11/29
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {


    private CommentMapper commentMapper;

    private StudentMapper studentMapper;


    @Autowired
    protected CommentServiceImpl(CommentMapper commentMapper, StudentMapper studentMapper) {
        this.commentMapper = commentMapper;
        this.studentMapper = studentMapper;
    }


    @Override
    @Transactional(rollbackFor = TransactionalException.class)
    public void agree(String studentId, int commentId) throws RuntimeException {

        //外键约束检查-----该评论是否存在

        //保存点赞数据
        try {
            commentMapper.saveAgreement(studentId, commentId);
        } catch (Exception e) {
            throw new TransactionalException("保存点赞数据失败");
        }

        //更新评论的点赞数
        int res = commentMapper.increaseAgreeCount(commentId);
        if (res != 1) {
            throw new TransactionalException("更新评论的点赞数失败");
        }

    }

    @Override
    @Transactional(rollbackFor = TransactionalException.class)
    public void cancelAgreement(String studentId, int commentId) throws RuntimeException {

        //删除点赞数据
        int res1 = commentMapper.deleteAgreement(studentId, commentId);
        if (res1 != 1) {
            throw new TransactionalException("删除点赞数据失败-该评论可能不存在");
        }

        //更新评论的点赞数
        int res2 = commentMapper.decreaseAgreeCount(commentId);
        if (res2 != 1) {
            throw new TransactionalException("更新评论的点赞数失败");
        }
    }

    @Override
    public boolean isAgreed(String studentId, int commentId) {

        return commentMapper.isAgreed(studentId, commentId) == 1;
    }

    @Override
    public PageInfo<Comment> getChapterComments(int pageNum, String sid, String cid) {
        PageHelper.startPage(pageNum, 5);
        List<Comment> comments = commentMapper.findByChapterId(cid);
        //个性化
        comments.forEach(it -> {
            Student stu = studentMapper.findNameAndImgById(it.getStudentId());
            it.setAuthor(stu.getName());
            it.setImg(stu.getImg());
            it.setIsAgreed(commentMapper.isAgreed(sid, it.getId()) == 1);
        });
        return new PageInfo<>(comments);
    }


    @Override
    public Comment getCommentById(int id) {
        Comment comment = commentMapper.findById(id);
        if (comment == null) {
            return null;
        }
        String sid = comment.getStudentId();
        Student stu = studentMapper.findNameAndImgById(sid);
        comment.setAuthor(stu.getName());
        comment.setImg(stu.getImg());
        comment.setIsAgreed(false);
        return comment;
    }
}
