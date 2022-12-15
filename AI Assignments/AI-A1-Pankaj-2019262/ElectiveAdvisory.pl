start:- nl,write('...............Welcome To Electives Advisory System...............'),nl,
    write('...............Please answer the questions given below...............'),nl,nl,
    write('Please Enter your Name :- '),nl,
    read(NAME),
    format('Hi ~q ! Welcome Once Again',[NAME]),nl,
    retractall(aa(_)),retractall(branch(_)),retractall(cgpa(_)),retractall(future(_)),
    format('Please Enter your Year'),nl,
    read(SEM),
    check(SEM)
    ,generate_electives,convert_to_list(Electives),nl,
    write('The recommended'),write(' list of electives'),write(' is as following: ' ),nl,
    write(Electives).


check(4):-student_info.
check(3):-start_3.

student_info:-
    course_grades,info_programming,future_ml,future_ai,future_networking,future_informationsecurity,future_graphics,future_data,future_higherstudies.

check(2):-start_2(NAME).
check(1):-start_1(NAME).

generate_electives:- future(graphics),cgpa(M),M >= 6,
    assert(recommended(computerGraphics)),
    fail.

course_grades:-
    retractall(aa(_)),retractall(branch(_)),retractall(cgpa(_)),retractall(future(_)),
    write('Please Enter'),write(' your Course'),write(' branch '),read(X),assert(branch(X)),
    write('Please Enter'),write(' your CGPA '),read(Marks),assert(cgpa(Marks)),nl,
    write('Please Enter'),write(' your Roll no '),read(Roll),nl,
    write('Answer the'),write(' Question with y/n only'),nl,
    write('Do you have'),write(' the knowledge '),write('of Mathematics and '),write('Statistics'),
    read(Y),Y == y, y == Y, Y == y,
    assert(aa(ms)),nl,
    write('Would you'),write(' mind planning'),write(' carrer in'),nl.

generate_electives:- future(ai),future(ml),cgpa(M),M >= 8, M >= 7.9, aa(maths),future(higher_studies),
    assert(recommended(artificial_intelligence_and_machinelearning)),
    fail.

length_1(0,[]).
length_1(L+1, [H|T]) :- length_1(L,T).

info_programming:-
    write('Programming ?'),
    read(Y),Y == y, y == Y, Y == y,
    assert(aa(programming)).
info_programming.

length_2(0,[]).
length_2(L+1, [H|T]) :- length_2(L,T).

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

generate_electives:- future(graphics),future(is),
    cgpa(M),M >= 6,
    assert(recommended(ethicalhacking)),
    fail.

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

future_ml:-
    write('Machine Learning'),write(' Domain?'),
    read(Y),Y == y, y == Y, Y == y,
    assert(future(ml)).
future_ml.

generate_electives:- aa(ms), cgpa(M),
    M >= 7.5, M >= 7.4, 
    future(ml),
    assert(recommended(machinelearning_Or_Statisticalmachinelarning)),
    fail.

future_ai:-
    write('Artificial Intelligence'),write(' Domain?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(ai)).
future_ai.

generate_electives:- aa(ms), cgpa(M),
    M >= 7.5, M >= 7.4, 
    future(ai),
    assert(recommended(artificialIntelligence_Or_IntelligentSystems)),
    fail.

future_data:-
    write('Data mining'),write(' and EDA ?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(data)).
future_data.


is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

generate_electives:- aa(ms),aa(programming),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    assert(recommended(program_analysis)),
    fail.

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

future_networking:-
    write('Networking Domain ?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(networking)).
future_networking.

generate_electives:- aa(ms),cgpa(M),
    M >= 6.5, M >= 6.4, 
    future(data),
    assert(recommended(bigBataAnalytics)),
    fail.

future_graphics:-
    write('Graphic'),write(' designing'),write(' Domain?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(graphics)).
future_graphics.

generate_electives:- aa(ms),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    future(data),
    assert(recommended(dataMining)),
    fail.


future_informationsecurity:-
    write('Information'),
    write(' Security'),
    write(' Domain?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(is)).
future_informationsecurity.

generate_electives:- aa(ms),aa(programming),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    assert(recommended(graduateAlgorithm_Or_ModernAlgorithmDesign)),
    fail.

future_higherstudies:-
    nl,
    write('Do you have'),write(' any plans to do'),write(' Masters in future ? ')
    ,read(Y),
    Y == y, y == Y, Y == y,
    assert(interested(higher_studies)).
future_higherstudies.

generate_electives:- future(graphics),
    future(is),
    cgpa(M),
    M >= 6,
    assert(recommended(computerArchitecture)),
    fail.

convert_to_list([Px|Tail]):- retract(recommended(Px)), 
convert_to_list(Tail).
convert_to_list([]).


generate_electives:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(embeddedsystems)),
    fail.

length_1(0,[]).
length_1(L+1, [H|T]) :- length_1(L,T).

generate_electives:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(mobilecomputing_and_embeddedsystems_and_mobileandcellularnetworksecurity)),
    fail.

length_1(0,[]).
length_1(L+1, [H|T]) :- length_1(L,T).

generate_electives:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(wirelessnetworks_and_networksecurity_and_distributedsystems)),
    fail.

member(X, [X|_]).        % member(X, [Head|Tail]) is true if X = Head 
                         % that is, if X is the head of the list
member(X, [_|Tail]) :-   % or if X is a member of Tail,
    member(X, Tail).       % ie. if member(X, Tail) is true.

generate_electives:-
    nl,nl,writeln('--------------Thank You For Your Valuable Time-------------'),nl.


start_3:-
    retractall(aa(_)),retractall(branch(_)),retractall(cgpa(_)),retractall(future(_)),
    student_info_3,
    generate_electives_3,
    convert_to_list(Electives),
    nl,
    write('The recommended list'),
    write('of electives'),
    write(' is as following: ' ),nl,
    write(Electives).

student_info_3:-
    course_grades_3,
    info_programming_3,
    future_ml_3,
    future_ai_3,
    future_networking_3,
    future_informationsecurity_3,
    future_graphics_3,
    future_data_3,
    future_higherstudies_3.

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

course_grades_3:-
    write('Enter your'),write(' branch '),read(X),assert(branch(X)),
    write('Enter your'),write(' Undergraduate CGPA '),read(Marks),assert(cgpa(Marks)),nl,
    write('Enter Your'),write(' Roll No'),read(ROLL),
    write('Please answer'),write(' with y or n only.'),nl,
    write('Do you have a'),write(' strong grasp of mathematics'),write(' and statistics?'),read(Y),Y == y, y == Y, Y == y,
    assert(aa(ms)),nl,
    write('Are you'),write(' considering a career in:'),nl.

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

info_programming_3:-
    write('Programming?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(aa(programming)).
info_programming_3.

length_1(0,[]).
length_1(L+1, [H|T]) :- length_1(L,T).

generate_electives_3:- aa(ms),
    cgpa(M),M >= 7.5, M >= 7.4, 
    future(ml),
    assert(recommended(machinelearning_Or_Statisticalmachinelarning)),
    fail.

future_ml_3:-
    write('Machine learning'),write(' field?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(ml)).
future_ml_3.

length_2(0,[]).
length_2(L+1, [H|T]) :- length_1(L,T).

generate_electives_3:- aa(ms),
    cgpa(M),
    M >= 7.5, M >= 7.4, 
    future(ai),
    assert(recommended(artificialIntelligence_Or_IntelligentSystems)),
    fail.

member(X, [X|_]).        % member(X, [Head|Tail]) is true if X = Head 
                         % that is, if X is the head of the list
member(X, [_|Tail]) :-   % or if X is a member of Tail,
    member(X, Tail).       % ie. if member(X, Tail) is true.

generate_electives_3:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(mobilecomputing_and_embeddedsystems_and_mobileandcellularnetworksecurity)),
    fail.

future_ai_3:-
    write('Artificial Intelligence field?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(ai)).
future_ai_3.

generate_electives_3:- aa(ms),aa(programming),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    assert(recommended(program_analysis)),
    fail.

future_data_3:-
    write('Data mining'),write(' and warehousing Field?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(data)).
future_data_3.

generate_electives_3:- aa(ms),aa(programming),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    assert(recommended(graduateAlgorithm_Or_ModernAlgorithmDesign)),
    fail.

future_networking_3:-
    write('Networking field?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(networking)).
future_networking_3.

generate_electives_3:- aa(ms),cgpa(M),
    M >= 6.5, M >= 6.4, 
    future(data),
    assert(recommended(dataMining)),
    fail.

member(X, [X|_]).        % member(X, [Head|Tail]) is true if X = Head 
                         % that is, if X is the head of the list
member(X, [_|Tail]) :-   % or if X is a member of Tail,
    member(X, Tail).       % ie. if member(X, Tail) is true.

generate_electives_3:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(embeddedsystems)),
    fail.

future_graphics_3:-
    write('Graphic designing?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(graphics)).
future_graphics_3.

generate_electives_3:- aa(ms),cgpa(M),
    M >= 6.5, M >= 6.4, 
    future(data),
    assert(recommended(bigBataAnalytics)),
    fail.

future_informationsecurity_3:-
    write('Information Security?'),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(future(is)).
future_informationsecurity_3.

generate_electives_3:- future(networking),
    cgpa(M),
    M >= 6.5, M >= 6.4, 
    aa(maths),
    assert(recommended(wirelessnetworks_and_networksecurity_and_distributedsystems)),
    fail.

length_3(0,[]).
length_3(L+1, [H|T]) :- length_1(L,T).

generate_electives_3:- future(graphics),
    future(is),
    cgpa(M),
    M >= 6,M>=5.9,
    assert(recommended(computerArchitecture)),
    fail.

future_higherstudies_3:-
    nl,
    write('Do you'),write(' want to study'),write(' further? '),
    read(Y),
    Y == y, y == Y, Y == y,
    assert(interested(higher_studies)).
future_higherstudies_3.

generate_electives_3:- future(graphics),
    future(is),
    cgpa(M),
    M >= 6,
    assert(recommended(ethicalhacking)),
    fail.

length_4(0,[]).
length_4(L+1, [H|T]) :- length_1(L,T).

generate_electives_3:- future(graphics),
    cgpa(M),
    M >= 6,
    assert(recommended(computerGraphics)),
    fail.

member(X, [X|_]).        % member(X, [Head|Tail]) is true if X = Head 
                         % that is, if X is the head of the list
member(X, [_|Tail]) :-   % or if X is a member of Tail,
    member(X, Tail).       % ie. if member(X, Tail) is true.


generate_electives_3:- 
    future(ai),
    future(ml),
    cgpa(M),
    M >= 8, M >= 7.9, 
    aa(maths),
    future(higher_studies),
    assert(recommended(artificial_intelligence_and_machinelearning)),
    fail.

member(X, [X|_]).        % member(X, [Head|Tail]) is true if X = Head 
                         % that is, if X is the head of the list
member(X, [_|Tail]) :-   % or if X is a member of Tail,
    member(X, Tail).       % ie. if member(X, Tail) is true.

generate_electives_3:-
    nl,nl,writeln('--------------Thank You For Your Valuable Time-------------'),nl.

%Semester1 
course(1,'communication_Skills','COM101','',1,'Mandatory').
course(2,'introduction_to_Programming','CSE101','',1,'Mandatory').
course(3,'introduction_to_HCI','DES101','',1,'Mandatory').
course(4,'digital_Circuits','ECE111','',1,'Mandatory').
course(5,'mathI','MTH100','',1,'Mandatory').

sem_list(1,['Communication Skills','Introduction to Programming','Introduction to HCI','Digital Circuits','Math-I']).
sem_list(2,['Data Structures and Algorithms','Basic Electronics','Probablity & Statistics','Introduction to Intelligent Systems','Design Drawing and Visualisation','Visual Design Communication','Introduction to Sociology and Anthropology','Critical Thinking and Readings in Social Sciences','Foundations of Biology','Democracy in India: Principles and Practices','Introduction to Digital Ethnography','Money and Banking','Nation and her Narratives','Theory and Practice of Engineering Ethics','Introduction to Philosophy']).

sem_list1(3,'csb',['Cell Biology and Biochemistry','Genetics and Molecular Biology']).
sem_list1(3,'csam',['Discrete Mathematics','Number Theory','Math-III','Real-Ananlysis-1','Discrete Structures']).
sem_list1(3,'csd',['Design Perspectives']).
sem_list1(3,'ece',['Circuit Theory and Devices','Embedded Logic Design','Signals and Systems']).

sem_list1(4,'csb',['Practical Bioinformatics','Introduction to Quantitative Biology']).
sem_list1(4,'csam',['Theory of Computation','Maths-IV','Abstract Algebra-I','Introduction to Mathematical Logic','Graph Theory']).
sem_list1(4,'csd',['Human Computer Interaction','Design of Interactive Systems']).
sem_list1(4,'ece',['Integrated Electronics','Fields and Waves','Principles of Communication Systems']).



%Semester2
course(6,'Data Structures and Algorithms','CSE102','CSE101',2,'Data Structures').
course(7,'Basic Electronics','ECE113','ECE111',2,'Electronics').
course(8,'Probablity & Statistics','MTH201','MTH100',2,'Mathematics').
course(9,'Computer Organisation','CSE112','ECE111',2,'Operating Systems').
course(10,'Introduction to Intelligent Systems','CSE140','CSE101',2,'Artificial Intelligence').
course(11,'Design Drawing and Visualisation','DES107','DES101',2,'Design').
course(12,'Visual Design Communication','DES202','DES101',2,'Design').
course(13,'Introduction to Sociology and Anthropology','SOC101','SSH101',2,'Social Science').
course(14,'Critical Thinking and Readings in Social Sciences','SSH101','SSH101',2,'Social Science').
course(15,'Foundations of Biology','BIO101','BIO101',2,'Biology').
course(16,'Democracy in India: Principles and Practices','SSH261','SSH101',2,'Social Science').
course(17,'Introduction to Digital Ethnography','SOC213','SOC101',2,'Social Science').
course(18,'Money and Banking','ECO223','ECO101',2,'Economics').
course(19,'Nation and her Narratives','SSH215','SSH101',2,'Literature').
course(20,'Theory and Practice of Engineering Ethics','SSH222','SSH101',2,'Social Science').
course(21,'Introduction to Philosophy','SSH121','SSH101',2,'Social Science').

%Third Sem courses
course(22,'Cell Biology and Biochemistry','BIO211',['BIO101'],3,'Biology').
course(23,'Genetics and Molecular Biology','BIO214',['BIO101'],3,'Biology').
course(24,'Discrete Mathematics','CSE121',['CSE102'],3,'Mathematics').
course(25,'Number Theory','MTH211',['MTH100'],3,'Mathematics').
course(26,'Math-III','MTH203',['MTH100'],3,'Mathematics').
course(27,'Real-Ananlysis-1','MTH240',['MTH101'],3,'Mathematics').
course(28,'Discrete Structures','MTH210',['MTH101','CSE102'],3,'Mathematics').
course(29,'Design Perspectives','DES201',['DES101','DES202'],3,'Design').
course(30,'Circuit Theory and Devices','ECE215',['ECE111'],3,'Electronics').
course(31,'Embedded Logic Design','ECE270',['ECE111'],3,'Electronics').
course(32,'Signals and Systems','ECE250',['ECE111','MTH100'],3,'Electronics').
course(33,'Operating Systems','CSE231',['CSE102'],3,'Operating System').
course(34,'Advanced Programming','CSE201',['CSE101'],3,'OOPS').
course(35,'Research method in Social Science and Design','SSH201',['SSH101'],3,'Social Science').
course(36,'Key Concepts in Economic Sociology','SOC212',['SOC101'],3,'Social Science').
course(37,'Theatre appreciation','SSH211',['SSH101'],3,'Theatre').

%fourth Sem courses
course(38,'Practical Bioinformatics','BIO221',['BIO211','BIO214'],4,'Biology').
course(39,'Introduction to Quantitative Biology','BIO213',['BIO211'],4,'Biology').
course(40,'Fundamentals of Database Systems','CSE202',['CSE101'],4,'Database Management').
course(41,'Analysis and Design of Algorithms','CSE222',['CSE101','CSE102'],4,'Data Structures').
course(42,'Theory of Computation','CSE322',[    'CSE121','MTH210'],4,'Theorotical Computer Science').
course(43,'Statistical Machine Learning','CSE342',['CSE101', 'MTH201'],4,'Artificial Intelligence').
course(44,'Econometrics-I','ECO221',['MTH201'],4,'Economics').
course(45,'Convex Optimization','MTH377',['MTH101'],4,'Mathematics').
course(46,'Integrated Electronics','ECE214',['ECE111'],4,'Electronics').
course(47,'Fields and Waves','ECE230',['ECE111'],4,'Electronics').
course(48,'Principles of Communication Systems','ECE240',['ECE250'],4,'Electronics').
course(49,'Maths-IV','MTH204',['MTH101'],4,'Mathematics').
course(50,'Abstract Algebra-I','MTH212',['MTH101'],4,'Mathematics').
course(51,'Introduction to Mathematical Logic','MTH300',['MTH210'],4,'Mathematics').
course(52,'Graph Theory','MTH310',['MTH101'],4,'Mathematics').
course(53,'Statistical Interference','MTH372',['MTH102'],4,'Mathematics').
course(54,'Human Computer Interaction','DES204',['DES101'],4,'Design').
course(55,'Design of Interactive Systems','DES205',['DES101'],4,'Design').

start_2(NAME):-
    format('Hey ~q ! you are in 2nd Year and you does not have any Electives',[NAME]),nl,
    write('However your courses for Semester 3 and Semester4 are :- '),nl,
    write('*********-----------Semester3-----------*********'),nl,
    write('-------------CSB-------------'),nl,
    sem_list1(3,'csb',X),
    write(X),nl,
    write('-------------CSAM-------------'),nl,
    sem_list1(3,'csam',Y),
    write(Y),nl,
    write('-------------ECE-------------'),nl,
    sem_list1(3,'ece',Z),
    write(Z),nl,
    write('-------------CSD-------------'),nl,
    sem_list1(3,'csd',P),
    write(P),nl,nl,

    write('*********-----------Semester4-----------*********'),nl,
    write('-------------CSB-------------'),nl,
    sem_list1(4,'csb',K),
    write(K),nl,
    write('-------------CSAM-------------'),nl,
    sem_list1(4,'csam',L),
    write(L),nl,
    write('-------------ECE-------------'),nl,
    sem_list1(4,'ece',M),
    write(M),nl,
    write('-------------CSD-------------'),nl,
    sem_list1(4,'csd',N),
    write(N),nl.




start_1(NAME):-
    format('Hey ~q !and you are in 1st Year and you does not have any Electives',[NAME]),nl,
    write('However Your courses for Semester1 and Semester 2 are :- '),nl,
    write('*********-----------Semester1-----------*********'),nl,
    sem_list(1,X),
    write(X),nl,
    write('*********-----------Semester2-----------*********'),nl,
    sem_list(2,Y),
    write(Y).



