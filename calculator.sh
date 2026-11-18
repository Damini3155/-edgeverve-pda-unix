echo "Enter two numbers:"
read a b

echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"

echo "Enter your choice:"
read ch

case $ch in
    1) echo "Result=$((a+b))" ;;
    2) echo "Result=$((a-b))" ;;
    3) echo "Result=$((a*b))" ;;
    4) echo "Result=$((a/b))" ;;
    *) echo "Invalid choice" ;;
esac