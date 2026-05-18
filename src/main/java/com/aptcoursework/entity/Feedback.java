package com.aptcoursework.entity;

import java.sql.Timestamp;

/**
 * Represents a feedback submission from the Contact Us form.
 * @author Heaven Gurung
 */
public class Feedback {
    private int feedbackID;
    private String name;
    private String email;
    private String subject;
    private String message;
    private Timestamp submittedAt;

    public Feedback() {
    }

    public Feedback(String name, String email, String subject, String message) {
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    public Feedback(int feedbackID, String name, String email, String subject, String message, Timestamp submittedAt) {
        this.feedbackID = feedbackID;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.submittedAt = submittedAt;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }
}
