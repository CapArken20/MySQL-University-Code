CREATE TABLE `ab_devcamp_sql_course_schema`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE
);
CREATE TABLE `ab_devcamp_sql_course_schema`.`professors` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE INDEX `professor_id_UNIQUE` (`professor_id` ASC) VISIBLE
);
CREATE TABLE `ab_devcamp_sql_course_schema`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(50) NOT NULL,
  `course_professor_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `course_name_UNIQUE` (`course_name` ASC) VISIBLE,
  INDEX `course_professor_id_idx` (`course_professor_id` ASC) VISIBLE,
  CONSTRAINT `course_professor_id` FOREIGN KEY (`course_professor_id`) REFERENCES `ab_devcamp_sql_course_schema`.`professors` (`professor_id`) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE `ab_devcamp_sql_course_schema`.`grades` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_value` DECIMAL(3, 3) NOT NULL,
  `grade_student_id` INT NOT NULL,
  `grade_course_id` INT NOT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE INDEX `grade_id_UNIQUE` (`grade_id` ASC) VISIBLE,
  INDEX `grade_course_id_idx` (`grade_course_id` ASC) VISIBLE,
  INDEX `grade_student_id_idx` (`grade_student_id` ASC) VISIBLE,
  CONSTRAINT `grade_course_id` FOREIGN KEY (`grade_course_id`) REFERENCES `ab_devcamp_sql_course_schema`.`courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `grade_student_id` FOREIGN KEY (`grade_student_id`) REFERENCES `ab_devcamp_sql_course_schema`.`students` (`student_id`) ON DELETE CASCADE ON UPDATE NO ACTION
);
INSERT INTO
  students(student_name)
VALUES
  ("Aric");
INSERT INTO
  students(student_name)
VALUES
  ("Nate");
INSERT INTO
  students(student_name)
VALUES
  ("Agui");
INSERT INTO
  students(student_name)
VALUES
  ("Santi");
INSERT INTO
  students(student_name)
VALUES
  ("Seth");
INSERT INTO
  professors(professor_name)
VALUES
  ("Mrs. Beck");
INSERT INTO
  professors(professor_name)
VALUES
  ("Mr. Murphy");
INSERT INTO
  professors(professor_name)
VALUES
  ("Ms. Jones");
INSERT INTO
  professors(professor_name)
VALUES
  ("Mr. Lee");
--So FYI the reasons the professors only teach one course each here is because the course they are in charge of is very exhausting
INSERT INTO
  courses(course_name, course_professor_id)
VALUES
  ("Homeroom", 1);
INSERT INTO
  courses(course_name, course_professor_id)
VALUES
  ("US History", 2);
INSERT INTO
  courses(course_name, course_professor_id)
VALUES
  ("AP Biology", 3);
INSERT INTO
  courses(course_name, course_professor_id)
VALUES
  ("Gym", 4);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 1, 1);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 1, 2);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 1, 3);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 1, 4);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 1, 5);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 2, 1);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 2, 2);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 2, 3);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 3, 1);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 4, 1);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 4, 2);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 4, 3);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 4, 4);
INSERT INTO
  grades(grade_value, grade_course_id, grade_student_id)
VALUES
  (RAND(), 4, 5);
SELECT
  AVG(grade_value)
FROM
  grades
WHERE
  grade_course_id = (
    SELECT
      course_professor_id
    FROM
      courses
    WHERE
      course_professor_id = (
        SELECT
          professor_id
        FROM
          professors
        WHERE
          professor_name = "Mr. Murphy"
      )
  );
SELECT
  AVG(grade_value)
FROM
  grades
WHERE
  grade_course_id = (
    SELECT
      course_professor_id
    FROM
      courses
    WHERE
      course_professor_id = (
        SELECT
          professor_id
        FROM
          professors
        WHERE
          professor_name = "Ms. Jones"
      )
  );
SELECT
  AVG(grade_value)
FROM
  grades
WHERE
  grade_course_id = (
    SELECT
      course_professor_id
    FROM
      courses
    WHERE
      course_professor_id = (
        SELECT
          professor_id
        FROM
          professors
        WHERE
          professor_name = "Mr. Lee"
      )
  );
SELECT
  MAX(grade_value)
FROM
  grades
WHERE
  grade_student_id = (
    SELECT
      student_id
    FROM
      students
    WHERE
      student_name = "Aric"
  );
SELECT
  MAX(grade_value)
FROM
  grades
WHERE
  grade_student_id = (
    SELECT
      student_id
    FROM
      students
    WHERE
      student_name = "Nate"
  );
SELECT
  MAX(grade_value)
FROM
  grades
WHERE
  grade_student_id = (
    SELECT
      student_id
    FROM
      students
    WHERE
      student_name = "Agui"
  );
SELECT
  MAX(grade_value)
FROM
  grades
WHERE
  grade_student_id = (
    SELECT
      student_id
    FROM
      students
    WHERE
      student_name = "Santi"
  );
SELECT
  MAX(grade_value)
FROM
  grades
WHERE
  grade_student_id = (
    SELECT
      student_id
    FROM
      students
    WHERE
      student_name = "Seth"
  );
SELECT
  student_name,
  course_name
FROM
  students
  JOIN grades ON grades.grade_student_id = student_id
  JOIN courses ON courses.course_id = grade_course_id
ORDER BY
  course_name;
SELECT
  course_id,
  course_name,
  AVG(grade_value)
FROM
  courses
  JOIN grades ON grades.grade_course_id = course_id
GROUP BY
  grade_value;
SELECT
  student_name,
  professor_name
FROM
  students
  LEFT JOIN grades ON grade_student_id = student_id
  JOIN courses ON course_id = grade_course_id
  RIGHT JOIN professors ON professor_id = course_professor_id
ORDER BY
  professor_id;