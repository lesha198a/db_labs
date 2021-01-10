import random
import backend

random.seed()


def main_menu_printer():
    print("\n\nmenu:")
    print("\t0 - show table")
    print("\t1 - insert row in product")
    print("\t2 - delete row")
    print("\t3 - update row in product")
    print("\t4 - search by product_id")
    print("\t5 - search by customer_id")
    print("\t6 - randomize data in product")
    print("\t7 - commit changes")
    print("\t8 - commit + exit\n")


def tables_chooser_printer():
    print("\n\nchoose table:")
    print("\t0 - cart_product")
    print("\t1 - customer")
    print("\t2 - customer_passport")
    print("\t3 - product")
    print("\t4 - product_photo\n")
    print("\t5 - previous menu\n")


def menu(db):
    main_menu_printer()
    while True:
        mode = input("enter number: ")
        if len(mode) != 1 or mode[0] < '0' or mode[0] > '7':
            print("invalid input")
            continue
        imode = int(mode)
        if imode == 0:
            show_table_menu(db)
            main_menu_printer()
        if imode == 1:
            insert_menu(db)
            main_menu_printer()
        if imode == 2:
            del_table_menu(db)
            main_menu_printer()
        if imode == 3:
            upd_row_product_menu(db)
            main_menu_printer()
        if imode == 4:
            search_menu(db, 1)
            main_menu_printer()
        if imode == 5:
            search_menu(db, 0)
            main_menu_printer()
        if imode == 6:
            backend.add_product(db, randomstring(), randomstring(), random.randint(1, 20000))
            main_menu_printer()
        if imode == 7:
            db.commit()
        if imode == 8:
            break


def show_table_menu(db):
    tables_chooser_printer()
    while True:
        mode = input("enter number: ")
        if len(mode) != 1 or mode[0] < '0' or mode[0] > '6':
            print("invalid input")
            continue
        imode = int(mode)
        if imode == 0:
            backend.reader(db, "cart_product")
        if imode == 1:
            backend.reader(db, "customer")
        if imode == 2:
            backend.reader(db, "customer_passport")
        if imode == 3:
            backend.reader(db, "product")
        if imode == 4:
            backend.reader(db, "product_photo")
        if 5 >= imode >= 0:
            break


def randomstring():
    length = random.randint(5, 15)
    res = ""
    for i in range(length):
        res += chr(random.randint(ord('a'), ord('z')))
    return res


def insert_menu(db):
    name = input("set product name: ")
    desc = input("set product description: ")
    price = input("set product price: ")
    backend.add_product(db, name, desc, int(price))


def del_table_menu(db):
    tables_chooser_printer()
    while True:
        mode = input("enter number: ")
        if len(mode) != 1 or mode[0] < '0' or mode[0] > '6':
            print("invalid input")
            continue
        imode = int(mode)
        if imode == 0:
            del_table_row_menu(db, "cart_product")
        if imode == 1:
            del_table_row_menu(db, "customer")
        if imode == 2:
            del_table_row_menu(db, "customer_passport")
        if imode == 3:
            del_table_row_menu(db, "product")
        if imode == 4:
            del_table_row_menu(db, "product_photo")
        if 5 >= imode >= 0:
            break


def del_table_row_menu(db, table):
    row = 0
    loop = True
    while loop:
        try:
            row = int(input("row's id to delete (only int >= 0): "))
            if row < 0:
                print("it is lower than 0. try again...")
            else:
                loop = False
        except ValueError:
            print("it is not int. try again...")
    backend.delete_row(db, table, row)


def upd_row_product_menu(db):
    row = 0
    price = 0
    loop = True
    while loop:
        try:
            row = int(input("row's id to update (only int >= 0): "))
            price = int(input("set price (only int >= 0): "))
            if row < 0:
                print("row is lower than 0. try again...")
            if price < 0:
                print("price is lower than 0. try again...")
            else:
                loop = False
        except ValueError:
            print("it is not int. try again...")
    backend.upd_product(db, row, price)


def search_menu(db, option):
    if option == 1:
        name = "product"
    else:
        name = "customer"
    row_id = 0
    loop = True
    while loop:
        try:
            row_id = int(input(f"{name}'s id to search (only int >= 0): "))
            if row_id < 0:
                print(f"{name}'s id is lower than 0. try again...")
            else:
                loop = False
        except ValueError:
            print("it is not int. try again...")
    if option == 1:
        backend.product_customer_search(db, row_id)
    else:
        backend.customer_product_search(db, row_id)
