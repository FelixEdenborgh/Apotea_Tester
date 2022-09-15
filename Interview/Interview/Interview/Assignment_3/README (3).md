På Apoteas lager kan samma produkt finnas på flera platser. 
För att kunna plocka den behöver vi beräkna alla möjliga kombinationer som existerar 
utifrån olika hyllor. 


Om en kund t.e.x har beställt 4 av en produkt och det finns hyllor 
[A:4], [B:2], [C:3] så är möjliga kombinationer [A:4], [B:2,A:2], [C:2,A:2], [B:2,C:2], [B:1,C:3].


At Apotea, a certain product may exist at multiple locations in the warehouse. Many reasons exist for this, such as that we want to separate products
based on best before date or batch number for medicine to be able to trace down customers in case something goes wrong with a certain batch
of medicine products.

Given this, there exist multiple ways an order item can be picked, based on how many products the customer has bought and which stock quantities
in different locations exist. For instance, given these stock items: 

[A:4], [B:2], [C:3] 

These (exact) combinations exist for different amount of items ordered by the customer:

1 -> [A:1], [B:1], [C:1]

3 -> [A:3], [B:2, A:1], [B:2, C:1], [C:3]

4 -> [A:4], [B:2,A:2], [B:2,C:2], [C:3,A:1], [C:3,B:1]

6 -> [A:4, B:2], [A:4, C:2], [B:2, A:1, C:3]

Obviously, we want to pick as much as we can in a single location. Therefore, the solution should not return every possible combination
of quantities, but rather all different combinations that exist given that you pick as much as you can at every shelf you use for comparison.

In the example above, that means that when we're designing combinations based on the A shelf for quantity 4, we can pick 4 at A, so we only 
return that shelf with 4. But when we look at the B shelf, we can only pick 2, and we then create combinations also with the A shelf, since that 
means emptying the B shelf. Then, it's up to the consumer of this method to decide which combinations are desirable based on the optimization of choice.

Good luck!