package com.yjg.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjg.entity.Feedback;

public interface FeedbackService {
    
    /**
     * 获取所有的微信用户反馈
     * @return List<Feedback>
     */
    List<Feedback> getAllFeedback();
    
    /**
     * 获取所有未读的微信用户反馈
     * @return List<Feedback>
     */
    List<Feedback> getAllFeedbackByIsRead();

    /**
     * 根据id段获取的用户反馈
     * @param id
     * @return List<Feedback>
     */
    Feedback getFeedbackById(int id);
    
    /**
     * 根据id修改用户反馈读写状态
     * @param id
     * @param isRead
     */
    void updateFeedbackIsReadById(int id,String isRead);
    
    /** 
     * 把全部用户反馈标为已读
     */
    void updateFeedbackIsRead();
    
    /**
     * 根据id把用户反馈删除
     * @param id
     */
    void deleteFeedbackById(int id);
    
    /**
     * 根据多个id删除多个对应的用户反馈
     * @param id 
     */
    void deleteFeedbackByIds(@Param("id") int[] id);
}
