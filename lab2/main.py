import psycopg2
import menu


def connect():
    res = psycopg2.connect(
        host="localhost",
        database="lab1",
        user="python",
        password="1234")
    return res


if __name__ == '__main__':
    conn = connect()
    menu.menu(conn)
    conn.commit()
    conn.close()
