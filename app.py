from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="110398123Abc.",
        database="arizona_university_info"
    )
    return connection


@app.route("/")
def home():
    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute("SELECT * FROM universities")
    universities = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("index.html", universities=universities)


@app.route("/uarizona")
def uarizona():
    connection = get_db_connection()
    cursor = connection.cursor()

    # Academic programs
    cursor.execute("""
        SELECT program_name
        FROM academic_programs
        WHERE university_id = 1
    """)
    programs = cursor.fetchall()

    # Admissions
    cursor.execute("""
        SELECT student_type, requirements, deadline_info
        FROM admissions
        WHERE university_id = 1
    """)
    admissions = cursor.fetchall()

    # Financial aid
    cursor.execute("""
        SELECT aid_type, aid_name, description, aid_url
        FROM financial_aid
        WHERE university_id = 1
    """)
    financial_aid = cursor.fetchall()

    # Support programs
    cursor.execute("""
        SELECT program_name, description, program_url
        FROM support_programs
        WHERE university_id = 1
    """)
    support_programs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "uarizona.html",
        programs=programs,
        admissions=admissions,
        financial_aid=financial_aid,
        support_programs=support_programs
    )


@app.route("/nau")
def nau():
    connection = get_db_connection()
    cursor = connection.cursor()

    # Academic programs
    cursor.execute("""
        SELECT program_name
        FROM academic_programs
        WHERE university_id = 2
    """)
    programs = cursor.fetchall()

    # Admissions
    cursor.execute("""
        SELECT student_type, requirements, deadline_info
        FROM admissions
        WHERE university_id = 2
    """)
    admissions = cursor.fetchall()

    # Financial aid
    cursor.execute("""
        SELECT aid_type, aid_name, description, aid_url
        FROM financial_aid
        WHERE university_id = 2
    """)
    financial_aid = cursor.fetchall()

    # Support programs
    cursor.execute("""
        SELECT program_name, description, program_url
        FROM support_programs
        WHERE university_id = 2
    """)
    support_programs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "nau.html",
        programs=programs,
        admissions=admissions,
        financial_aid=financial_aid,
        support_programs=support_programs
    )


@app.route("/asu")
def asu():
    connection = get_db_connection()
    cursor = connection.cursor()

    # Academic programs
    cursor.execute("""
        SELECT program_name
        FROM academic_programs
        WHERE university_id = 3
    """)
    programs = cursor.fetchall()

    # Admissions
    cursor.execute("""
        SELECT student_type, requirements, deadline_info
        FROM admissions
        WHERE university_id = 3
    """)
    admissions = cursor.fetchall()

    # Financial aid
    cursor.execute("""
        SELECT aid_type, aid_name, description, aid_url
        FROM financial_aid
        WHERE university_id = 3
    """)
    financial_aid = cursor.fetchall()

    # Support programs
    cursor.execute("""
        SELECT program_name, description, program_url
        FROM support_programs
        WHERE university_id = 3
    """)
    support_programs = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "asu.html",
        programs=programs,
        admissions=admissions,
        financial_aid=financial_aid,
        support_programs=support_programs
    )


@app.route("/compare")
def compare():
    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute("""
        SELECT abbreviation, name, location, description
        FROM universities
        ORDER BY university_id
    """)
    universities = cursor.fetchall()

    cursor.execute("""
        SELECT u.abbreviation, GROUP_CONCAT(ap.program_name SEPARATOR ', ')
        FROM universities u
        JOIN academic_programs ap ON u.university_id = ap.university_id
        GROUP BY u.abbreviation
    """)
    programs = dict(cursor.fetchall())

    cursor.execute("""
        SELECT u.abbreviation, GROUP_CONCAT(sp.program_name SEPARATOR ', ')
        FROM universities u
        JOIN support_programs sp ON u.university_id = sp.university_id
        GROUP BY u.abbreviation
    """)
    support_programs = dict(cursor.fetchall())

    cursor.execute("""
        SELECT u.abbreviation, GROUP_CONCAT(fa.aid_name SEPARATOR ', ')
        FROM universities u
        JOIN financial_aid fa ON u.university_id = fa.university_id
        GROUP BY u.abbreviation
    """)
    financial_aid = dict(cursor.fetchall())

    cursor.close()
    connection.close()

    return render_template(
        "compare.html",
        universities=universities,
        programs=programs,
        support_programs=support_programs,
        financial_aid=financial_aid
    )

@app.route("/search")
def search():
    query = request.args.get("q", "")

    connection = get_db_connection()
    cursor = connection.cursor()

    if query:
        cursor.execute("""
            SELECT 
                ap.program_name,
                ap.category,
                ap.degree_level,
                u.name,
                u.abbreviation,
                ap.program_url
            FROM academic_programs ap
            JOIN universities u ON ap.university_id = u.university_id
            WHERE ap.program_name LIKE %s
               OR ap.category LIKE %s
               OR u.name LIKE %s
        """, (f"%{query}%", f"%{query}%", f"%{query}%"))
    else:
        cursor.execute("""
            SELECT 
                ap.program_name,
                ap.category,
                ap.degree_level,
                u.name,
                u.abbreviation,
                ap.program_url
            FROM academic_programs ap
            JOIN universities u ON ap.university_id = u.university_id
        """)

    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("search.html", results=results, query=query)

if __name__ == "__main__":
    app.run(debug=True)