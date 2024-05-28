CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

# Then, add here code to compile and run, and do any post-processing of the
# tests

cd grading-area
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

filename="*.java"
if [ "$filename" != "ListExamples.java" ]
then
echo "Cannot locate file" > ../student-submission/results.txt
fi

if [ $? -ne 0 ]
then
echo "$Compile error" > ../student-submission/results.txt
else
    echo "Compile successful" > ../student-submission/results.txt
fi
