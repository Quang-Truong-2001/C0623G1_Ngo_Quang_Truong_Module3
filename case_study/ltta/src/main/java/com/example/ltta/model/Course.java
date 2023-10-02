package com.example.ltta.model;

public class Course {
        private int id;
        private String name;
        private String description;
        private String instructor;
        private double price;
        private int contentId;
        private int categoryId;

        public Course(int id, String name, String description, String instructor, double price, int contentId, int categoryId) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.instructor = instructor;
            this.price = price;
            this.contentId = contentId;
            this.categoryId = categoryId;
        }

        public Course(String name, String description, String instructor, double price, int contentId, int categoryId) {
            this.name = name;
            this.description = description;
            this.instructor = instructor;
            this.price = price;
            this.contentId = contentId;
            this.categoryId = categoryId;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getInstructor() {
            return instructor;
        }

        public void setInstructor(String instructor) {
            this.instructor = instructor;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public int getContentId() {
            return contentId;
        }

        public void setContentId(int contentId) {
            this.contentId = contentId;
        }

        public int getCategoryId() {
            return categoryId;
        }

        public void setCategoryId(int categoryId) {
            this.categoryId = categoryId;
        }
}
