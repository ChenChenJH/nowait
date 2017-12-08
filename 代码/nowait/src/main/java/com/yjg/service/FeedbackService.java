package com.yjg.service;

import java.util.List;

import com.yjg.entity.Feedback;

public interface FeedbackService {
    
    /**
     * 根據起始行獲取7條微信用戶反饋
     * @param row 起始行
     * @return List<Feedback>
     */
    List<Feedback> getAllFeedback(int row) throws Exception;
    
    /**
     * 獲取用戶反饋數量
     * @return int
     */
    int getAllFeedbackCount() throws Exception;
    
    /**
     * 根據起始行和讀寫狀態獲取7條微信用戶反饋
     * @param row 起始行
     * @param isRead 讀寫狀態
     * @return List<Feedback>
     */
    List<Feedback> getAllFeedbackByIsRead(int row,String isRead) throws Exception;
    
    /**
     * 根據讀寫狀態獲取用戶數量
     * @param isRead 讀寫狀態
     * @return int
     */
    int getAllFeedbackCountByIsRead(String isRead) throws Exception;

    /**
     * 根據id獲取用戶反饋
     * @param id
     * @return List<Feedback>
     */
    Feedback getFeedbackById(int id) throws Exception;
    
    /**
     * 根據id修改用戶反饋讀寫狀態
     * @param id
     * @param isRead
     */
    void updateFeedbackIsReadById(int id,String isRead) throws Exception;
    
    /** 
     * 把全部未讀用戶反饋標為已讀
     */
    void updateFeedbackIsRead() throws Exception;
    
    /**
     * 根據id刪除用戶反饋
     * @param id
     */
    void deleteFeedbackById(int id) throws Exception;
    
    /**
     * 根據多個id刪除多個對應的用戶反饋
     * @param id 
     */
    void deleteFeedbackByIds(int[] id) throws Exception;
}
