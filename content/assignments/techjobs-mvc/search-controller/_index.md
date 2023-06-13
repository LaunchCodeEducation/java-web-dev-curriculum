---
title: "Complete SearchController"
date: 2023-05-22T10:20:54-05:00
draft: false
weight: 3
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Complete `SearchController`

Add a `displaySearchResults` handler method to `SearchController`:

1. Use the correct annotation for the method. To configure the correct mapping
   type and mapping route, refer to the `form` tag in the `search.html`
   template. (Use `@GetMapping` or `@PostMapping` rather than `@RequestMapping`.)
1. The `displaySearchResults` method should take in a `Model` parameter.
1. The method should also take in two other parameters, specifying the type of
   search and the search term.
1. In order for these last two parameters to be properly passed in by Spring
   Boot, you need to use the correct annotation. Also, you need to name them
   appropriately, based on the corresponding form field names defined in
   `search.html`.
1. If the user enters "all" in the search box, or if they leave the box empty,
   call the `findAll()` method from `JobData`. Otherwise, send the search
   information to `findByColumnAndValue`. In either case, store
   the results in a `jobs` ArrayList.
1. Pass `jobs` into the `search.html` view via the `model` parameter.
1. Pass `ListController.columnChoices` into the view, as the existing
   `search` handler does.