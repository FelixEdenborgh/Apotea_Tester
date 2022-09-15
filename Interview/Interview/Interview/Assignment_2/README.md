I SQL Management Studio finns en databas, apotea_student. I den finns exempeltabeller som liknar Apoteas struktur.

Implementera funktionen GetWeightAndPriceForTopRegions. Funktionen skall räkna ut vilka postnummer som under de senaste 6 månaderna haft högst försäljning i fråga om totalt antal
beställningar. För dessa postnummer beräknas sedan snittordervärdet - dvs den genomsnittliga summan varje kund betalat för sin order - samt snittvikten.

Funktionen returnerar sedan de högst nbrOfZipCodes säljande postnumren, med dess snittordervikt och snittordervärde grupperat per fraktsätt för det postnumret.

Lycka till!





Implement the function GetWeightAndPriceForTopRegions. The function shall compute which zip codes have had the higest sales in terms of number of orders the past 6 months.

For the highest nbrOfZipCodes amount of zip codes, compute the average order value and average order weight for each zip code, grouped by each shipping method within that zip code.
The order value of an order is the sum that the customer pays when placing an order on the website, e.g. the sum of all the total price of all order items ordered.

The function then returns the top nbrOfZipCodes with the average values per shipping method.

Good luck!