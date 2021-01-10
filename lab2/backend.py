import psycopg2


def reader(db, name):
    try:
        cur = db.cursor()
        cur.execute(f"SELECT * FROM {name}")
        print(f"{name} table has {cur.rowcount} rows")
        row = cur.fetchone()
        while row is not None:
            print(row)
            row = cur.fetchone()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return


def add_product(db, name, description, price):
    try:
        cur = db.cursor()
        cur.execute(f"insert into product(name,description,price) VALUES( %s, %s, {price})",
                    (name, description))
        print("row is inserted")
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return


# noinspection SqlResolve
def delete_row(db, table, row_id):
    try:
        cur = db.cursor()
        cur.execute(f"DELETE FROM \"{table}\" WHERE id={row_id}")
        print("row is deleted")
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return


def upd_product(db, prod_id, price):
    try:
        cur = db.cursor()
        cur.execute(f"UPDATE product SET price ='{price}' WHERE id = {prod_id} ")
        print("row is updated")
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return


def product_customer_search(db, prod_id):
    try:
        cur = db.cursor()
        cur.execute(f"SELECT product.id, product.name, customer.name, customer_passport.passport_num FROM product"
                    f" INNER JOIN cart_product on product.id = cart_product.product_id"
                    f" INNER JOIN customer on cart_product.customer_id = customer.id INNER JOIN customer_passport on"
                    f" customer.id = customer_passport.customer_id WHERE product.id = {prod_id} ")
        print(f"found {cur.rowcount} rows")
        row = cur.fetchone()
        while row is not None:
            print(row)
            row = cur.fetchone()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return


def customer_product_search(db, customer_id):
    try:
        cur = db.cursor()
        cur.execute(f"SELECT customer.id, customer.name, customer_passport.passport_num, product.name FROM customer"
                    f" INNER JOIN cart_product on customer.id = cart_product.customer_id"
                    f" INNER JOIN product on cart_product.product_id = product.id INNER JOIN customer_passport on"
                    f" customer.id = customer_passport.customer_id WHERE customer.id = {customer_id} ")
        print(f"found {cur.rowcount} rows")
        row = cur.fetchone()
        while row is not None:
            print(row)
            row = cur.fetchone()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return
