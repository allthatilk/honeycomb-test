# Honeycomb Engineering Test - Makers Edition

## Comments on solution

* It works! Woo!

However...

* Not happy with injecting order into special offer instead of the other way around but didn't want to change order much from original version to help keep to SRP and didn't want to make special offer injection (default or not) compulsory for orders.
* Tried to keep offers flexible to change, but ended up having 2 rigid methods within special offers with changeable values instead... don't feel this was a great compromise but didn't find a better solution in the time frame.
* In order for discounts to be calculated according to the brief, the calculate discount function has to be used rather than the discount functions directly, which kind of makes sense in terms of SRP but is also annoyingly clunky. If you calculate the discounts separately instead of dependently you get $39 for the combined discounts so this was how I solved that.
* Added discounts to command line print-out via method rather than injection for reasons mentioned in first point.
* Made discount methods private as no need to access them externally.

## The challenge

We have a system that delivers advertising materials to broadcasters. 

Advertising Material is uniquely identified by a 'Clock' number e.g.

* `WNP/SWCL001/010`
* `ZDW/EOWW005/010`

Our sales team have some new promotions they want to offer so 
we need to introduce a mechanism for applying Discounts to orders.

Promotions like this can and will change over time so we need the solution to be flexible.

### Broadcasters

These are the Broadcasters we deliver to

* Viacom
* Disney
* Discovery
* ITV
* Channel 4
* Bike Channel
* Horse and Country


### Delivery Products

* Standard Delivery: $10
* Express Delivery: $20

### Discounts

* Send 2 or more materials via express delivery and the price for express delivery drops to $15
* Spend over $30 to get 10% off

### What we want from you

Provide a means of defining and applying various discounts to the cost of delivering material to broadcasters.

We don't need any UI for this, we just need you to show us how it would work through its API.

## Examples

Based on the both Discounts applied, the following examples should be valid:

* send `WNP/SWCL001/010` to Disney, Discovery, Viacom via Standard Delivery and Horse and Country via Express Delivery
    based on the defined Discounts the total should be $45.00

* send `ZDW/EOWW005/010` to Disney, Discovery, Viacom via Express Delivery
     based on the defined Discounts the total should be $40.50
