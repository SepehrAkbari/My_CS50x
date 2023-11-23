#include "helpers.h"

void colorize(int height, int width, RGBTRIPLE image[height][width])
{
    // Change all black pixels to a color of your choosing
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            if (image[i][j].rgbtRed == 0x000000 && image[i][j].rgbtBlue == 0x000000 && image[i][j].rgbtGreen == 0x000000)
            {
                image[i][j].rgbtRed = 0xc7;
                image[i][j].rgbtBlue = 0xf;
                image[i][j].rgbtGreen = 0xd;
            }
        }
    }
}
