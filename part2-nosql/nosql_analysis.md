Section A – RDBMS Limitations (150 words)

Relational databases struggle when product attributes vary widely across categories. A laptop requires RAM, processor, and storage attributes, while shoes require size and color. Modeling this in RDBMS requires multiple nullable columns or separate tables, leading to sparse data and complex joins. Schema changes for new product types require costly ALTER operations. Additionally, storing customer reviews as nested objects is inefficient, requiring separate tables and joins.

Section B – MongoDB Benefits (150 words)

MongoDB supports flexible document schemas, allowing each product to store only relevant attributes. Reviews can be embedded directly within product documents, improving read performance. MongoDB also supports horizontal scaling through sharding, making it suitable for growing catalogs and high read traffic.

Section C – Trade-offs (100 words)

MongoDB lacks strong ACID guarantees across multiple documents compared to relational databases. Complex joins and transactional reporting are harder to implement. Additionally, enforcing strict data consistency requires application-level logic.
