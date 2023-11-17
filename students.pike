class course {
    string name;
    array(int) grades;

    void create(string n) {
        name = n;
        grades = ({});
    }

    void addGrade(int grade) {
        grades +=({ grade });
    }

    void total() {
        int count = sizeof(grades);
        int total; 
        for (int i = 0; i < sizeof(grades); i++) {
            total += grades[i];
        }
        int avg = (total / count);
        write(name + " - " + count + " exams - " + avg + " avg\n");
    }
}

class student {
    string name;
    array(course) courses;

    void create(string n) {
        name = n;
        courses = ({});
    }

    void addGrade(string courseName, int grade) {
        course c;
        for (int i = 0; i < sizeof(courses); i++) {
            if (courses[i]->name == courseName) {
                c = courses[i];
            }
        }
        if (!c) {
            c = course(courseName);
            courses += ({c});
        }
        c->addGrade(grade);
    }

    void totals() {
        write("Grades for " + name + "\n");
        for (int i = 0; i < sizeof(courses); i++) {
            courses[i]->total();
        }
    }
}

void help() {
    write("Grading system\n");
    write("add-student [name] - Add student\n");
    write("select-student [name] - Select a student\n");
    write("add-grade [course] [grade] - Add a grade for a course for the current selected student\n");
    write("end - Stop the program\n");
}

int main() {
    student s;
    array(student) students = ({});

    while(1) {
        string command=Stdio.Readline()->read("Input command:");
        if (command=="quit" || command=="end") break;
        if (command=="help") help();
        if (sscanf(command, "add-student %s", string name)) {
            s = student(name);
            students += ({s});
        }
        if (sscanf(command, "select-student %s", string studentName)) {
            student selected;
            for (int i = 0; i < sizeof(students); i++) {
                if (students[i]->name == studentName) {
                    selected = students[i];
                }
            }
            if (!selected) {
                write("Student " + studentName + " not found\n");
            } else {
                write("Student " + studentName + " is selected\n");
                s = selected;
            }     
        }
        if (sscanf(command, "add-grade %s %d", string course, int grade)) {
            if (!s) {
                write("No student is selected\n");
            } else {
                s->addGrade(course, grade);
            }        
        }
    }

    for (int i = 0; i < sizeof(students); i++) {
        students[i]->totals();
    }
  
    return 0;
}
