package com.yjg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yjg.entity.Feedback;

@Repository
public interface FeedbackMapper {
    
    /**
     * 根據起始行獲取7條微信用戶反饋
     * @param row 起始行
     * @return List<Feedback>
     */
    List<Feedback> selectAllFeedback(@Param("row") int row) throws Exception;
    
    /**
     * 查詢用戶反饋數量
     * @return int
     */
    int selectAllFeedbackCount() throws Exception;
    
    /**
     * 根據起始行和讀寫狀態查詢7條微信用戶反饋
     * @param row 起始行
     * @param isRead 讀寫狀態
     * @return List<Feedback>
     */
    List<Feedback> selectAllFeedbackByIsRead(@Param("row") int row, @Param("isRead") String isRead) throws Exception;
    
    /**
     * 根據讀寫狀態查詢用戶數量
     * @param isRead 讀寫狀態
     * @return int
     */
    int selectAllFeedbackCountByIsRead(@Param("isRead") String isRead) throws Exception;
    
    /**
     * 根據id查詢用戶反饋
     * @param id
     * @return List<Feedback>
     */
    Feedback selectFeedbackById(int id) throws Exception;
    
    /** 
     * 根據id修改用戶反饋讀寫狀態
     */
    void updateFeedbackIsReadById(@Param("id") int id,@Param("isRead") String isRead) throws Exception;
    
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
    void deleteFeedbackByIds(@Param("id") int[] id) throws Exception;
}
