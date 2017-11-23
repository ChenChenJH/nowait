package com.yjg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.yjg.entity.Feedback;

@Repository
public interface FeedbackMapper {
    
    /**
     * 查询所有的微信用户反馈
     * @return List<Feedback>
     */
    List<Feedback> selectAllFeedback();
    
    /**
     * 查询所有未读的微信用户反馈
     * @return List<Feedback>
     */
    List<Feedback> selectAllFeedbackByIsRead();
    
    /**
     * 根据id段查询的用户反馈
     * @param id
     * @return List<Feedback>
     */
    Feedback selectFeedbackById(int id);
    
    /** 
     * 根据id修改用户反馈读写状态
     */
    void updateFeedbackIsReadById(@Param("id") int id,@Param("isRead") String isRead);
    
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
