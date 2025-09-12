# MVP

---

## Feature 1: User Authentication

**User Story:**  
As a User, I want to be prompted to log-in on page load.  
**Details:**.
Create a log-in landing page with User Authentication. User can't access packing lists without logging in.

## Feature 2: View All Packing Lists.

**User Story:**.
As a User, I want to see all of my packing lists after logging in.  
**Details:**.
Create a User Show page and use GET request to retrieve and display all packing lists belonging to the User.

## Feature 3: View Individual Packing List

**User Story:**  
As a User, I want to click on a packing list to view its details so that I csn see all items for that trip.  
**Details:**.
Use link_to for each packing list on the user page. Display the packing list page with its details when clicked.

## Feature 4: View Packing List Details and Items

**User Story:**  
As a User, I want to see the details of a packing list along with all items currently on the list so I know what to pack.  
**Details:**.
Display packing list details: name, destination. Display all items on the packing list: name, category, and status. Order items by category.

## Feature 5: Add Items to Packing List

**User Story:**.
As a User, I want to add items to my packing list so that I can include everything I need for my trip.  
**Details:**.
Add an "Add Items" button on the packing list page. Display all available items on the items page. Allow selection of multiple items add to the packing list.

## Feature 6: Track Packed/Unpacked Status

**User Story:**.
As a User, I want to mark items as packed or unpacked so that I can keep track of what I have already packed.  
**Details:**.
Add a toggle button for each item to switch between packed and unpacked. Add an indication beside item name when it is packed.

## Feature 7: Remove Packing List

**User Story:**.
As a User, I want to delete my packing list once I have travelled.
**Details:**.
Add a delete button for each list on user dashboard. Use a DELETE request to remove the packing list when clicked.

## Feature 8: Remove Items from Packing List

**User Story:**.
As a User, I want to delete items from my packing list so that I can remove items I no longer need.  
**Details:**.
Add a delete button for each item. Use a DELETE request to remove the item from the packing list when clicked.

---

# Stretch Goals

## Feature 1: Create Custom Items

**User Story:**.
As a User, I want to create my own custom items so that I can track items specific to my trip.  
**Details:**.
Create a "New Item" form with name and category fields. On submission, add the ite, tot he database and display it on the Items page.

## Feature 2: Indicate Already Added Items

**User Story:**.
As a User, I want the list to indicate which items have already been added so that I don't accidentally add duplicates.  
**Details:**.
Grey out items already included on the packing list. Add message if the User tries to add an item already included on the packing list.

## Feature 3: Change Quantity of Items.

**User Story:**.
As a User, I want to add and adjust the quantity of items on my packing list so that I can pack the correct number of each item.  
**Details:**.
Create a form with a text field for each item showing the current quantity. Allow updating the quantity via a PATCH request. Add a "Update Items" button to save changes to multiple items at once.
