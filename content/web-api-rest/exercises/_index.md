---
title: "Exercises: Web APIs and REST"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Sally Steuterman # to be set by the page reviewer
reviewerGitHub: gildedgardenia # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2024-01-01T07:15:35-06:00 # UPDATE ANY TIME CHANGES ARE MADE
---

We've created a basic API application [here](https://github.com/LaunchCodeEducation/events-api). Before we ask you to fork and clone this, let's first think conceptually about the kinds of requests a client application could make to this API.

## The API

The API starts by only exposing a single resource, `Event`, and four endpoints for interacting with it.

### The Resource

The shape of the `Event` resource describes the general form of its properties and value types:

```bash {linenos=table}
Event {
   id: integer
   name: string
   description: string
}
```


In our case, the `Event` shape is just the properties and types (translated to portable [JSON types](https://json-schema.org/understanding-json-schema/reference/type.html) defined in a `Event` model class.

```java {linenos=table}
public class Event {
   public int id;
   public string name;
   public string description;

...getters

...setters
}
```

An example of a real `Event` JSON response to a `GET` request would look like this:

```bash {linenos=table}
{
   "id": 1,
   "name": "LaunchCode API demo",
   "description": "Learn how to use Postman to interact with an API!"
}
```

Notice how this JSON is just a representation of an instance of the `Event` model class. The data shape has been converted from a Java object representation to a JSON string representation, so it can be transported over HTTP. Recall that we perform this 
conversion, or serialization, so that our API can output data in a portable format that is language-agnostic.

### The Endpoints

This branch of the API has four endpoints: 

1. [GET Coding Events](#get-coding-events)
1. [GET a Single Coding Event](#get-a-single-coding-event)
1. [Create a Coding Event](#create-a-coding-event)
1. [Delete a Coding Event](#delete-a-coding-event)

#### Get Coding Events

We'll ask you to consider some details of how to describe these endpoints.

Remember, an endpoint is made up of a path (to the resource) and a method (action to take on the 
resource). Because we only have one resource, each of our endpoints share a common entry-point path of `/events`. Request and response bodies are all in JSON, or more specifically, they have a `Content-Type` header value of `application/json`.

Making a `GET` request to the entry-point of a resource should return a representation of the state of the collection. In our case, this representation is a JSON array with `Event` elements:

```bash
[
   Event { ... },
   ...
]
```

If the current state of the collection is empty, then we will just get back an empty JSON array:

```bash {linenos=table}
   []
```

{{% notice green "Question" "rocket" %}}
Using our endpoint shorthand, how would we describe this action?

Some items to consider:

1. What is the HTTP request type being used?
1. What is the resource path being requested?
1. Is there a request body being sent? What is included in it?
1. If the request is successful, what information can we expect to be included in the response?
{{% /notice %}}

#### GET a Single Coding Event

If you want to view the representation of a single entity, you need to provide information to uniquely identify it in the collection. Since the entry-point represents the collection, it can be followed by an `id` value in the path to look inside the collection and return just the corresponding entity.

When describing entity endpoints, we use a path variable notation, `{variableName}`, to symbolize where the value needs to be put in the path. 

If an entity with the given `id` is found, we will get a single `Event` JSON object back. If it is not found, we will receive a response with a `404` status code to indicate the failed lookup.

{{% notice green "Question" "rocket" %}}
Using our endpoint shorthand, how would we describe this action?

Some items to consider:

1. What is the HTTP request type being used?
1. What is the resource path being requested?
1. Is there a request body being sent? What is included in it?
1. If the request is successful, what information can we expect to be included in the response?
1. If the request contains an error, what information can we expect to be included in the response?
{{% /notice %}}

#### Create a Coding Event

Think about what it means to create an entity. You need to provide the required data and the collection it belongs to. When we want to create an `Event`, we are asking the API to change the state of the collection (the list of entities) so our path must be `/events`. Recall that the "C" in CRUD stands for "create". Putting the resource and the action together, we know we 
need to `POST` to the `/events` endpoint. Finally, as part of our request, we will need to send a request body containing the data required to create the entity.

The shape of the `NewEvent` describes the JSON body that the endpoint expects:

```bash
NewCodingEvent {
   name: string
   description: string
}
```

When making a request, you would need to send a JSON body like this to satisfy the general shape:

```bash
{
   "name": "Halloween Hackathon!",
   "description": "A gathering of nerdy ghouls to work on GitHub Hacktoberfest contributions"
}
```

{{% notice blue "Note" "rocket" %}}
We only provide the user editable fields, not the unique `id` which the API handles internally when saving to the database.
{{% /notice %}}

Recall that when a `POST` request is successful, the API should respond with the `201`, or *Created*, HTTP status code. As part of the `2XX` HTTP success status codes, it indicates a particular type of successful response with a special header.

One of the REST conventions states that when an entity is created, the response should include both this status and the `Location` header that provides the URL of the new entity:

```bash
Location=<server origin>/events/<new entity id>
```

As an example:

```bash {linenos=table}
Location=http://localhost:8080/events/1
```

You can then issue a `GET` request to the `Location` header value and view the new entity. 

If the request fails because of a client error, then it will respond with a `400` status code and a message about what went wrong.
 
{{% notice green "Question" "rocket" %}}
Using our endpoint shorthand, how would we describe this action?

Some items to consider:

1. What is the HTTP request type being used?
1. What is the resource path being requested?
1. Is there a request body being sent? What is included in it?
1. If the request is successful, what information can we expect to be included in the response?
1. If the request contains an error, what information can we expect to be included in the response?
{{% /notice %}}

#### Delete a Coding Event

Deleting a `Event` resource is an operation on a single entity. Just like the endpoint for getting a single entity, this endpoint requires an `id` path variable. When a resource is deleted, a RESTful API should respond with a `204` status code. Similar to the `201` status, this code indicates a success with no response body or special headers. 

If you attempt to delete a resource that doesn't exist (with an incorrect `id`), then the endpoint will respond with an expected `404` status and message.

{{% notice green "Question" "rocket" %}}
Using our endpoint shorthand, how would we describe this action?

Some items to consider:

1. What is the HTTP request type being used?
1. What is the resource path being requested?
1. Is there a request body being sent? What is included in it?
1. If the request is successful, what information can we expect to be included in the response?
1. If the request contains an error, what information can we expect to be included in the response?
{{% /notice %}}

### Install Postman
Now that we've explored working with those endpoints, we're almost ready to start running the API and test sending those requests. 
You'll need to [install Postman]({{< relref "../../../appendices/install-postman/_index.md" >}}) to work with this lesson's studio and practice running these requests.
