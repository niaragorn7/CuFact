# Domain definition

Customer has one or more Opportunities.

Opportunity has one or more Quotes.

Quote has one or more Quote Items.

Each Quote Item references one Product and specifies a quantity.

Each quote is converted into an order, one order per quote.

Approval is out of scope for this iteration.

---------------------
## Data Model 
Customer
- id
- name

Opportunity
- customer_id
- id
- name

Quote
- opportunity_id
- id
- status
- total_price

QuoteItem
- quote_id
- id
- product_id
- quantity
- unit_price

Product
- id
- name
- price

Order
- quote_id
- id
- status
- crated_at

OrderItem
- id
- order_id
- product_id
- quantity
- unit_price

---------------------

## Relationship
Customer 1 ── N Opportunity
Opportunity 1 ── N Quote
Quote 1 ── N QuoteItem
Product 1 ── N QuoteItem
Quote 1 ── 1 Order

---------------------

## Basic statuses

Quote 
- Draft (not yet submitted)
    Fully editable
- Pending Approval [sync in progress] (when submitted)
    Not editable, can be cancelled using a button
- Accepted (through approval steps on SF)
    Not editable
- Rejected (with comments)
    Similar to Draft,  can be edited

Order
- Draft (order not fully completed)
- Submitted (to AWS)
- Confirmed (response from AWS)
- Completed (fulfilled)
- Failed (AWS failure)
- Cancelled

---------------------

## Basic rules

An Order can only be created from an Accepted Quote.

When an Order is created, it starts as Draft.

When submitted, the Order becomes Submitted. It becomes Confirmed when AWS responds successfully, if not, it will respond Failed.

Completed represents an Order that was successfully completed.

Cancelled represents an Order that was cancelled before completion.

Regarding quote modifications after order has been gerated:
- If Quote changes before Order confirmation, then update/regenerate the Order.
- If Quote changes after confirmation, then cancel the existing Order, then generate/resubmit a new Order so the synchronization process runs again.

The Quote remains the source of the commercial definition; the Order is the operational snapshot.

---------------------

## Customer to Order (C2O)
Customer is stored on Salesforce, from it we can create a opportunities, within we can create quotes. 

When a quote is created, it stands as Draft, when it's submitted, switches to Pending Approval, and depending on the approval steps, it will be either Accepted or Rejected.

When quote has been Accepted, order can be created from within the quote, and stands as Draft. When specifications are completed, order can be submitted to AWS, where it will be received, processed and AWS output a response 201 Created if successful, Salesforce receives the response and quote switches to Accepted, if something goes wrong on AWS, it will output Failed.

If order is Confirmed, QuoteItems will be further stored within AWS for further processing

---------------------

## Status Transitions

### Quote

Draft → Pending Approval  
Pending Approval → Accepted  
Pending Approval → Rejected  
Pending Approval → Draft (cancelled)  
Rejected → Draft

### Order

Draft → Submitted  
Submitted → Confirmed  
Submitted → Failed  
Confirmed → Completed  
Confirmed → Cancelled  
Failed → Submitted