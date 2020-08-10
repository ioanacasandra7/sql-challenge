--Create and populate tables

CREATE TABLE "department" (
    "dep_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dep_no"
     )
);
SELECT * FROM department

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
	"emp_title_id" varchar NOT NULL,
	"birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);
SELECT * FROM employee

CREATE TABLE "dept_manager" (
    "dep_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);
SELECT * FROM dept_manager

CREATE TABLE "dep_employee" (
    "emp_no" int   NOT NULL,
    "dep_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dep_employee" PRIMARY KEY (
        "emp_no", "dep_no"
     )
);
SELECT * FROM dep_employee
DROP TABLE title
CREATE TABLE "title" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);
SELECT * FROM title
CREATE TABLE "salary" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_no"
     )
);
SELECT * FROM salary
ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salary" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dep_no" FOREIGN KEY("dep_no")
REFERENCES "department" ("dep_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dep_employee" ADD CONSTRAINT "fk_dep_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dep_employee" ADD CONSTRAINT "fk_dep_employee_dep_no" FOREIGN KEY("dep_no")
REFERENCES "department" ("dep_no");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "title" ("title_id");