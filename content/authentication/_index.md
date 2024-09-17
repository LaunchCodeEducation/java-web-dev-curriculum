---
title: "Chapter 19: Authentication"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 19
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Sally Steuterman # to be set by the page reviewer
reviewerGitHub: gildedgardenia # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-12-08T15:28:21-06:00 # UPDATE ANY TIME CHANGES ARE MADE
---

## Learning Objectives

After completing this chapter, you should be able to do the following:
1. Understand the basic concepts of authentication
1. Use request filters to enable basic authentication in a Spring app
1. Explain what two-way encryption is, and why it is not ideal for storing sensitive user data, such as passwords
1. Explain what a one-way hash is, and why it presents greater security for storing sensitive user data
1. Describe the characteristics of a good one-way hash function
1. Write code that uses a provided hash function to hash sensitive data
1. Describe how one-way hashes allow for passwords to be compared
1. Describe the general authentication flow for a web app

## Key Terminology

### Introduction to Authentication
1. cookies
1. authorization
1. authentication
1. sessions

### Hashing Password
1. two-way encryption
1. one-way encryption
1. password hashing
1. collision
1. bcrypt
1. MD5, SHA1
1. hash function

### Creating a User Model
1. bcrypt
1. query methods

### Filtering Requests
1. request filters
1. allowlist
1. code-based configuration

## Content Links

{{% children %}}
