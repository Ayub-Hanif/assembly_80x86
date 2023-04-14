//
// Name:      Mohammad Ayub Hanif Saleh
// Class:     CISP 310
// Professor: Dr. Suha Al Juboori
// Date:      1/27/2023
//

#include <iostream>

int main() {

    int remainder, total = 0, binaryNumber;
    std::string answer;
    do
    {
        std::cout << "please type your binary numbers: ";
        std::cin >> binaryNumber;

        int input[sizeof(binaryNumber)];

        int i = 1;
        while (binaryNumber > 0)
        {
            remainder = binaryNumber % 2;
            total = total + remainder * i;
            i *= 2;
            binaryNumber = binaryNumber / 10;
        }

        i = 0;
        while (total != 0)
        {
            input[i] = total % 16;
            total = total / 16;
            i++;
        }

        std::cout << "The hexadecimal value: ";
        for (int z = i - 1; z >= 0; z--)
        {
            if (input[z] > 9)
            {
                std::cout << (char)(input[z] + 55) << std::endl;
            }
            else std::cout << input[z];
        }

        std::cout << "\n";
        std::cout << "DO you want to exit: Y/N: ";
        std::cin >> answer;
        std::cout << "\n";

    } while ((answer == "Y") || (answer == "y"));

}