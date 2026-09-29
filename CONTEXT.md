# Waraqah

A student book marketplace. Waraqah sells new books from its own stock, and readers resell used books to each other.

## Catalog

**Book**:
A title in Waraqah's catalog, independent of how it is printed. It belongs to exactly one **Section** and one **Category**, and has one or more **Editions**.
_Avoid_: product, listing, item

**Edition**:
One buyable version of a **Book**: a **Format** in a language, with its own price and stock. A Bangla paperback and an English hardcover of the same title are two Editions of one Book.
_Avoid_: variant, offer, SKU

**Format**:
The physical or digital form of an **Edition**: paperback, hardcover, or eBook.
_Avoid_: binding, type

**Translation**:
An **Edition** whose language differs from the language the **Book** was written in. It is not a separate Book.

**Section**:
One of Waraqah's fixed top-level shelves: Academic, Religious, Literature, Admission & Job Prep, School & College, Non-fiction, Skills & Tech, Children.
_Avoid_: department, genre

**Category**:
A named group of **Books** inside one **Section**, for example Islamic Studies inside Religious.
_Avoid_: subcategory, tag

**From-price**:
The price shown for a **Book** before an **Edition** is chosen: the cheapest Edition that can be ordered now (in stock or **Pre-order**), or the cheapest Edition when none can.
_Avoid_: best price, lowest vendor price

**List price**:
An **Edition**'s price before a discount. An Edition is discounted when its list price is higher than its price.
_Avoid_: original price, MRP

**Stock**:
How many copies of an **Edition** Waraqah can ship now.

**Pre-order**:
An **Edition** that is not released yet but can be ordered now.
