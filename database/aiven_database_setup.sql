USE defaultdb;

CREATE TABLE universities (
    university_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    abbreviation VARCHAR(20),
    location VARCHAR(100),
    website VARCHAR(255),
    description TEXT
);

CREATE TABLE academic_programs (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    university_id INT NOT NULL,
    program_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    degree_level VARCHAR(50),
    program_url VARCHAR(255),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE admissions (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    university_id INT NOT NULL,
    student_type VARCHAR(100),
    requirements TEXT,
    deadline_info VARCHAR(255),
    admission_url VARCHAR(255),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE transfer_pathways (
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,
    university_id INT NOT NULL,
    pathway_name VARCHAR(150),
    description TEXT,
    transfer_url VARCHAR(255),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE financial_aid (
    aid_id INT AUTO_INCREMENT PRIMARY KEY,
    university_id INT NOT NULL,
    aid_type VARCHAR(100),
    aid_name VARCHAR(150),
    description TEXT,
    aid_url VARCHAR(255),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE support_programs (
    support_id INT AUTO_INCREMENT PRIMARY KEY,
    university_id INT NOT NULL,
    program_name VARCHAR(150),
    target_group VARCHAR(150),
    description TEXT,
    program_url VARCHAR(255),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

USE arizona_university_info;

INSERT INTO universities
(name, abbreviation, location, website, description)
VALUES
(
    'University of Arizona',
    'UofA',
    'Tucson, Arizona',
    'https://www.arizona.edu',
    'Public research university focused on academic excellence, research, and student support.'
),
(
    'Northern Arizona University',
    'NAU',
    'Flagstaff, Arizona',
    'https://nau.edu',
    'Public university known for strong first-generation support, education programs, and transfer pathways.'
),
(
    'Arizona State University',
    'ASU',
    'Tempe, Arizona',
    'https://www.asu.edu',
    'Large public research university offering extensive academic programs, innovation, and transfer support.'
);

USE arizona_university_info;

INSERT INTO academic_programs
(university_id, program_name, category, degree_level, program_url)
VALUES

-- UofA
(1, 'Computer Science', 'Technology', 'Bachelor', 'https://www.arizona.edu/degree-search'),
(1, 'Applied Computing', 'Technology', 'Bachelor', 'https://www.arizona.edu/degree-search'),
(1, 'Business Administration', 'Business', 'Bachelor', 'https://www.arizona.edu/degree-search'),
(1, 'Nursing', 'Health Sciences', 'Bachelor', 'https://www.arizona.edu/degree-search'),

-- NAU
(2, 'Computer Science', 'Technology', 'Bachelor', 'https://nau.edu/undergraduate-degrees/'),
(2, 'Mechanical Engineering', 'Engineering', 'Bachelor', 'https://nau.edu/undergraduate-degrees/'),
(2, 'Elementary Education', 'Education', 'Bachelor', 'https://nau.edu/undergraduate-degrees/'),
(2, 'Criminal Justice', 'Social Sciences', 'Bachelor', 'https://nau.edu/undergraduate-degrees/'),

-- ASU
(3, 'Computer Science', 'Technology', 'Bachelor', 'https://www.asu.edu/academics'),
(3, 'Software Engineering', 'Technology', 'Bachelor', 'https://www.asu.edu/academics'),
(3, 'Business Administration', 'Business', 'Bachelor', 'https://www.asu.edu/academics'),
(3, 'Psychology', 'Social Sciences', 'Bachelor', 'https://www.asu.edu/academics');

USE arizona_university_info;

INSERT INTO financial_aid
(university_id, aid_type, aid_name, description, aid_url)
VALUES

-- UofA
(
    1,
    'Scholarships and Grants',
    'Scholarship Universe',
    'Scholarship matching system that helps admitted students find scholarship opportunities.',
    'https://www.arizona.edu/admissions/cost'
),
(
    1,
    'Grant',
    'Arizona Promise Grant',
    'Supports eligible Arizona resident students by helping cover tuition and mandatory fees after other gift aid.',
    'https://financialaid.arizona.edu/types-of-aid/undergraduate-grants/arizona-promise-grant'
),
(
    1,
    'Student Aid',
    'Federal Work-Study and Loans',
    'Financial aid options may include Federal Work-Study and Federal Direct Student Loans.',
    'https://www.arizona.edu/admissions/cost'
),

-- NAU
(
    2,
    'Scholarships and Grants',
    'NAU Scholarships',
    'Financial aid options include merit-based scholarships, need-based grants, and transfer scholarships.',
    'https://nau.edu/financial-aid/'
),
(
    2,
    'Student Aid',
    'Federal Work-Study and Loans',
    'Students may qualify for Federal Direct Student Loans and Federal Work-Study after completing FAFSA.',
    'https://nau.edu/financial-aid/'
),
(
    2,
    'Scholarship Tool',
    'Scholarship Universe',
    'Tool that helps students find scholarships based on academic profile, financial need, and background.',
    'https://nau.edu/financial-aid/scholarships/'
),

-- ASU
(
    3,
    'Scholarships and Grants',
    'Scholarship Universe',
    'Scholarship matching tool that helps students search for scholarship opportunities.',
    'https://admission.asu.edu/cost-aid'
),
(
    3,
    'Loan',
    'Federal Student Loans',
    'Federal loan options are available for eligible students who complete FAFSA.',
    'https://tuition.asu.edu/financial-aid/loans/federal'
),
(
    3,
    'Grant',
    'Transfer Achievement Grant',
    'Supports eligible Arizona resident transfer students from Arizona community colleges.',
    'https://admission.asu.edu/transfer/transfer-achievement-grant'
);

USE arizona_university_info;

INSERT INTO admissions
(university_id, student_type, requirements, deadline_info, admission_url)
VALUES

(
    1,
    'First-Year Students',
    'Application submission, academic transcripts, FAFSA recommended, residency verification',
    'Early Action Deadline: November 1',
    'https://www.arizona.edu/admissions'
),

(
    1,
    'Transfer Students',
    'Transfer credits evaluation, transcripts, residency verification',
    'Rolling deadlines depending on semester',
    'https://www.arizona.edu/admissions'
),

(
    2,
    'First-Year Students',
    'Application, high school GPA, transcripts, residency verification',
    'Deadlines vary by semester',
    'https://nau.edu/admissions/'
),

(
    2,
    'Transfer Students',
    'Transfer credit evaluation, transcripts, residency verification',
    'Rolling admissions available',
    'https://nau.edu/admissions/'
),

(
    3,
    'First-Year Students',
    'Application, official transcripts, GPA requirements, residency verification',
    'Priority deadlines vary',
    'https://www.asu.edu/admission'
),

(
    3,
    'Transfer Students',
    'Transfer credit review, official transcripts, residency verification',
    'Rolling admissions depending on program',
    'https://www.asu.edu/admission'
);

USE arizona_university_info;

INSERT INTO support_programs
(university_id, program_name, target_group, description, program_url)
VALUES

-- UofA
(
    1,
    'First Cats Program',
    'First-Generation Students',
    'Provides peer mentoring, faculty connections, workshops, and campus events for first-generation students.',
    'https://studentsuccess.arizona.edu/first-cats'
),
(
    1,
    'Dorrance Scholarship Program',
    'First-Generation Students',
    'Offers financial assistance, mentoring, leadership development, and academic support.',
    'https://financialaid.arizona.edu/types-of-aid/scholarships/dorrance-scholarship-program'
),
(
    1,
    'TRIO Student Support Services',
    'Low-Income and First-Generation Students',
    'Provides tutoring, advising, financial planning, and graduation support.',
    'https://www.arizona.edu/admissions/student-stories/first-gen-guide-applying-accepting'
),

-- NAU
(
    2,
    'First Scholars Program',
    'First-Generation Students',
    'Supports first-generation students with scholarships, mentoring, and academic guidance.',
    'https://nau.edu/financial-aid/aid-programs/first-generation/'
),
(
    2,
    'TRIO Student Support Services',
    'First-Generation and Income-Eligible Students',
    'Provides advising, tutoring, career guidance, and financial literacy support.',
    'https://in.nau.edu/first-gen/sss/'
),
(
    2,
    'First-Generation Programs Office',
    'First-Generation Students',
    'Connects students with mentors, workshops, and university resources.',
    'https://in.nau.edu/first-gen/'
),

-- ASU
(
    3,
    'New American University Scholarship',
    'Incoming First-Year Students',
    'Merit-based scholarship that helps reduce tuition costs for eligible students.',
    'https://tuition.asu.edu/new-american-university'
),
(
    3,
    'Transfer Achievement Grant',
    'Transfer Students',
    'Supports Arizona resident transfer students from community colleges with financial assistance.',
    'https://admission.asu.edu/transfer/transfer-achievement-grant'
),
(
    3,
    'TRIO Support Services',
    'First-Generation and Underrepresented Students',
    'Provides tutoring, mentoring, advising, and graduation planning support.',
    'https://access.asu.edu/trio'
);