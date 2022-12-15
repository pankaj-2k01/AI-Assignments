from durable.lang import *
with ruleset('interests'):
    @when_all(m.year == 1)
    def first(c):
        print("You need some more experience, Please do some more courses later on ")

    @when_all(m.year == 2)
    def first(c):
        print("You need some more experience, Please do some more courses later on ")

    # Data Scientist Recommended
    @when_all((m.interest.anyItem(item == 'Machine Learning')) & (m.interest.anyItem(item == 'Deep Learning')) &  (m.interest.anyItem(item != 'NLP')) & (m.interest.anyItem(item == 'Artificial Intelligence')) & (m.grades >= 7) & (m.year >= 3))
    def data_sci(c):
        print("Recomended Data Scientist")
        c.assert_fact('recommend', {'type': 'AI', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})
    
    # Data Scientist Strongly Recommended
    @when_all((m.interest.anyItem(item == 'Machine Learning')) & (m.interest.anyItem(item == 'Deep Learning')) & (m.interest.anyItem(item == 'Artificial Intelligence')) & (m.interest.anyItem(item == 'NLP')) & (m.grades >= 7) & (m.year >= 3))
    def data_sci1(c):
        print("Strongly Recommended Data Scientist")
        c.assert_fact('recommend', {'type': 'AI', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})

    # Machine Learning Engineer
    @when_all((m.interest.anyItem(item == 'Machine Learning')) & (m.interest.anyItem(item == 'Deep Learning')) & (m.interest.anyItem(item == 'Artificial Intelligence')) & (m.interest.anyItem(item == 'NLP')) & (m.grades >= 7) & (m.year >= 3))
    def data_ml1(c):
        print("Strongly Recommended Machine Learning Engineer")
        c.assert_fact('recommend', {'type': 'AI', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})

    # Network Security Engineer
    @when_all((m.interest.anyItem(item == 'FCS' and item=='CN')) & (m.interest.anyItem(item == 'Deep Learning')) and not(m.interest.anyItem(item == 'OS')) & (m.year >= 3))
    def ns(c):
        print("Recommended Network Security Engineer")
        c.assert_fact('recommend', {'type': 'Security', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})
        
    # Network Security Engineer
    @when_all((m.interest.anyItem(item == 'FCS' )) & (m.interest.anyItem(item == 'CN')) & (m.interest.anyItem(item == 'OS')) & (m.year >= 3))
    def ns(c):
        print("Strongly Recommended Network Security Engineer")
        c.assert_fact('recommend', {'type': 'Security', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})
    # devOPS

    @when_all((m.interest.anyItem(item == 'DBMS')) & (m.year >= 3))
    def devops(c):
        print("Strongly Recommended DevOPS")
        c.assert_fact('recommend', {'type': 'Database', 'grades': c.m.grades})
        c.assert_fact('suggest', {'type': 'AI', 'grades': c.m.grades})

    @when_all(+m.interest)
    def no_recommendation(c):
        print("Recommended: Web Development")

with ruleset('recommend'):
    @when_all((m.type == 'AI') & (m.grades > 6))
    def ec(e):
        print("Recommend Buisness Intelligence Developer")

    @when_all((m.type == 'Database') & (m.grades > 6))
    def ec1(e):
        print("Recommend Database Administrator")

    @when_all((m.type == 'Security') & (m.grades > 6))
    def ec2(e):
        print("Recommend Analyst Cybersecurity Consultant")

with ruleset('suggest'):
    @when_all((m.type == 'AI') & (m.grades > 6))
    def ec(e):
        print("Recommend Big Data Engineer")

    @when_all((m.type == 'Database') & (m.grades > 6))
    def ec1(e):
        print("Recommend Certified Computer Examiner")

    @when_all((m.type == 'Security') & (m.grades > 6))
    def ec2(e):
        print("Recommend Cybersecurity Architect Networking Software Development ")


#assert_fact('interests', { 'interest': ['Machine Learning','Artificial Intelligence','Deep Learning'], 'grades': 7.5 , 'year':3})
#assert_fact('interests', {'interest': ['FCS', 'CN', 'OS'], 'grades': 7.5, 'year': 3})


def courses():
    pass
    print("-------------------------- Welcome to the Career Advisory System --------------------------")
    name = input("Enter the NAME : ")
    roll = int(input("Enter the Roll No : "))
    branch = input("Enter the Branch : ")
    gpa=float(input("Enter the GPA : "))
    year = int(
        input("Enter the Year\n 1. First Year\n 2. Second year\n 3. Third Year\n 4. Fourth Year\n"))
    print("Hello "+name+" "+str(roll)+" "+branch+" " +
          "and Welcome to the Career Advisory System ")
    if(year!=1 and year!=2):
        print("Enter Your 4 Courses you have done so far [Machine Learning ,Deep Learning , Artificial Intelligence,NLP, OS, CN, FCS, DBMS]")
        done_course = []
        for i in range(0, 4):
            c = input()
            done_course.append(c)
        math = input("Are you interested in Maths ? Y/N ")
        database = input("Are you interested in Database ? Y/N ")
        android = input("Are you interested in Android Development ? Y/N ")
        cybersecurity = input("Are you interested in Network Security ? Y/N ")
        print(done_course)
        assert_fact('interests', {'interest': done_course, 'grades': gpa, 'year': year})
    else:
        assert_fact('interests', {'interest': [], 'grades': gpa, 'year': year})


courses()
