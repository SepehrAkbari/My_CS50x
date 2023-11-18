#include <cs50.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int sentencesC(string text);
int wordsC(string text);
int lettersC(string text);

int main(void)
{
    string text = get_string("Text: ");

    int Sentences = sentencesC(text);
    int Words = wordsC(text);
    int Letters = lettersC(text);

    float L = (float) Letters * 100 / (float) Words;
    float S = (float) Sentences * 100 / (float) Words;
    float index = 0.0588 * L - 0.296 * S - 15.8;

    int grade = round(index);

    if (grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade > 0 && grade < 16)
    {
        printf("Grade %i\n", grade);
    }
    else if (grade > 15)
    {
        printf("Grade 16+\n");
    }
}

int sentencesC(string text)
{
    int sentence = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            sentence++;
        }
    }
    return sentence;
}

int wordsC(string text)
{
    int word = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == ' ')
        {
            word++;
        }
    }
    return word + 1;
}

int lettersC(string text)
{
    int letter = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] != '.' && text[i] != '!' && text[i] != '?' && text[i] != '\'' && text[i] != ',' && text[i] != ' ' &&
            text[i] != ';' && text[i] != '"')
        {
            letter++;
        }
        else
        {
            letter += 0;
        }
    }
    return letter;
}
