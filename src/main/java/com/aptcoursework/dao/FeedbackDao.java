package com.aptcoursework.dao;

import com.aptcoursework.entity.Feedback;

import java.util.ArrayList;

/**
 * Data Access Object interface for managing Feedback database operations.
 * @author Heaven Gurung
 */
public interface FeedbackDao {
    Boolean addFeedback(Feedback feedback);
    ArrayList<Feedback> getAllFeedback();
}
