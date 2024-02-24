# Pitico's Care

My name is Rafael Seixas, and I am originally from Nova Lima, Minas Gerais. Since childhood, when I had my first contact with videogames, I developed a strong passion for this universe, and over time, I also became enchanted with the art of creating them. I came to Campinas to study Applied and Computational Mathematics at Unicamp, where I discovered another passion: cats, especially Pitico. It was during my journey in the city that the opportunity arose to participate in the Apple Developer Academy, where I have been for over a year, with Pitico by my side since the beginning. This game  is a tribute to him. 


# About the game

Pitico's Care is an experience built entirely in SwiftUI. My idea was to show that a game can be built regardless of platforms or libraries, with just creativity and persistence.
This game was a way to test my Swift knowledge and show that I could build what I believed in. Furthermore, I wanted to convey the message of the necessary care to adopt a cat and ensure they have a good quality of life.
In this file, you'll find how I organized the game's code, built the gameplay, and some final considerations
Please run the project on an iPhone 15.


## Files Organization

In this playground, the files are organized as follows:
-   Grid: Contains all files related to the logic, visualization, and mechanics of the game.
-   Navigation Screen: Contains all views used to build the app, **except** the GameView, which is grouped with the Grid files.
-   Assets: Contains all assets used in the project.
-   Resources: Contains the font used in the texts.


## The Gameplay

For the gameplay, it was necessary to create a matrix using loops with **for** and **ForEach**, where each element would be a button. However, for it to work with a piece collection game, they would have to have specific characteristics, such as, in this case, their color, defined by an **enum**.
With the matrix created and the colors defined, I created methods to identify neighboring items to the clicked object, to swap between neighboring objects vertically and horizontally, to analyze nearby pieces, and then finally to swap rows. Instead of deleting a matrix row and inserting another random one at the top, the code recognizes the row of 4 or more identical grouped objects, swaps their position with the first row, and then randomizes their colors.
To finalize the gameplay, I created a scoring system based on the number of queued objects and a responsive meter for each object color, allowing players to track their progress.


## Final considerations

For the project development, I utilized the Scrum process for task and requirement organization, allowing me to track my progress. 
All artwork and assets used in the project are of my own creation and were developed using the **Figma** software. 
The font used in the texts is called **Sobear** and was published on the _beFonts_ website at the following link: [https://befonts.com/sobear-font.html](https://befonts.com/sobear-font.html), with a license for free commercial use: [https://befonts.com/free-for-commercial-use](https://befonts.com/free-for-commercial-use).
For reasearch of the itens from the game i've interview my girlfrind who used to work in a cat NGO  used those links: https://blog.cobasi.com.br/caixa-de-areia-para-gatos/ ,  https://www.guiaderedesdeprotecao.com.br/a-importancia-das-redes-de-protecao-para-janelas/ ,  https://ofazedor.com/comedouro-qual-e-a-importancia-para-os-gatos/#:~:text=Além%20de%20proporcionar%20conforto%2C%20os,comida%20não%20poderia%20ser%20diferente. , https://catpower.com.br/a-importancia-de-colocar-telas-nas-janelas/ , https://chalesco.com.br/saiba-a-importancia-de-brinquedos-para-gatos/
 I would like to extend a special thank you to my family and colleagues from the Academy.
