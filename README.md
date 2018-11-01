<h1>Dasein</h1>

<p><b>
Dasein is an interactive algorithm structured system that symbolizes our unique individual life experience of being within a structural framework and allows us to experience the totality of everyone’s fundamental existence in relation to ours.
</b></p>

<br>
<h1>Abstract</h1>

<p>
Dasein is a German word for “being” or “existing”, popularly used by the German philosopher, Martin Heidegger, in his philosophical enquiry associated with authentic human existence and what it meant <i>to be</i>. Heidegger explored many fundamental core principles behind the question of how is it that anything existed, and what is the reality in which we find ourselves, what is it to be, and what negates being.
<br><br>
John Koenig writes <i>“if someone were to ask you on your deathbed what it was like to live here on Earth, perhaps the only honest answer would be, ‘I don't know. I passed through it once, but I've never really been there.’”</i> as he tries to describe the frustration of being stuck in just one body that inhabits only one place at a time, aware that you’ll never truly get to experience everything the world has to offer, that despite everything all the things you haven't done and may never get around to doing; all the destinations you didn't buy a ticket to; all the lights you see in the distance that you can only wonder about; all the alternate histories you narrowly avoided; all the fantasies that stay dormant inside your head; everything you're giving up, to be where you are right now, you’re closing billion doors in order to take a step forward.
<br><br>
With these notions in mind, Dasein is constructed- to provide an experience of multiple life experiences alongside yours, to visually depict the smallness of your perspective in the full coalescence of being, yet emphasize your individual existence as unique and relevant enough to have an impact on the final outcome.
</p>

<h1>Structure</h1>

<p>
The system operates inside a predefined grid, divided into segmented units arranged in sets of rows and columns, each unit functioning as a single independent cell inside the structure.
</p>

<table>
<tr><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td></tr>
<tr><td>&nbsp</td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr><td>&nbsp</td><td> </td><td> </td><td>0</td><td> </td><td> </td><td> </td></tr>
<tr><td>&nbsp</td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr><td>&nbsp</td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
</table>

<p>
Each cell has 2 aspects to it- its position (r, c) and its value (r, g, b). Initially, each cell has a default dead state, where each cell’s value is a gray (r=128, g=128, b=128), and each cell has been assigned a certain position in the grid (r= unique row, c= unique column). While the position of each cell is absolute, their value or color is variable and is subject to change at any time a user interacts with the system.
<br><br>
Each cell has a neighborhood, comprising of 2 concentric levels- level 1 & level 2. The neighborhood varies from cell to cell- depending on its placement in respect to the grid- whether it’s a corner cell, an edge cell or a cell placed in the middle, and depending on its placement, the number of cells in its neighborhood also vary.
</p>

<table>
<tr><td>&nbsp</td><td>2</td><td>2</td><td>2</td><td>2</td><td>2</td><td>&nbsp</td></tr>
<tr><td>&nbsp</td><td>2</td><td>1</td><td>1</td><td>1</td><td>2</td><td> </td></tr>
<tr><td>&nbsp</td><td>2</td><td>1</td><td>0</td><td>1</td><td>2</td><td> </td></tr>
<tr><td>&nbsp</td><td>2</td><td>1</td><td>1</td><td>1</td><td>2</td><td> </td></tr>
<tr><td>&nbsp</td><td>2</td><td>2</td><td>2</td><td>2</td><td>2</td><td> </td></tr>
</table>

<p>
A whole neighborhood contains a total of 24 cells (8 cells in level 1 neighborhood and 16 cells in level 2 neighborhood). The neighborhood is divided into levels as such to bring about a distinction in the amount of influence a cell has on the surrounding cells- the cells in level 1 are affected more prominently, while the cells in level 2 aren’t affected as much, and this change is reflected in the calculations in the algorithm.
<br><br>
The three components comprising the cell’s final value are the red, green and blue parameters which make up the cell’s display. Each of the three components hold a significant meaning, and contribute to the algorithm that makes up the choreography of the design.
<br><br>
The <i>red</i> component is the other cells’ influence on the cell, and the <i>blue</i> component is the cell’s influence on the other cell. However, the <i>green</i> component is unique to the cell, it’s the self-component that provides individuality to the cell.
</p>

<h1>Working</h1>

<p>
When a user interacts with the system, a cell at random is activated, and at the time of activation, the cell is assigned its individuality as a form of a randomly generated value of the green component.
</p>

<table>
<tr>
  <td>R</td>
  <td>G</td>
  <td>B</td>
  <td>Default State</td>
</tr>
<tr>
  <td>128</td>
  <td>128</td>
  <td>128</td>
</tr>
</table>

<table>
<tr>
  <td>R</td>
  <td>G</td>
  <td>B</td>
  <td>Activated State</td>
</tr>
<tr>
  <td>128</td>
  <td>x</td>
  <td>128</td>
</tr>
</table>

<p>After the activation process, the activated cell then proceeds to influence the cells in its neighborhood, according to the levels the surrounding cells fall into.</p>

<table>
<tr>
  <td>R<sub>0</sub></td>
  <td>G<sub>0</sub></td>
  <td>B<sub>0</sub></td>
  <td>Activated Cell</td>
</tr>
</table>

<table>
<tr>
  <td>R<sub>1</sub></td>
  <td>G<sub>0</sub></td>
  <td>B<sub>0</sub></td>
  <td>Level 1 Cells</td>
</tr>
</table>

<p>
where,
<br>
R<sub>1</sub>= R<sub>0</sub> + (R<sub>0</sub> - B<sub>0</sub>) / 4,<br>G<sub>0</sub>= 128,<br>B<sub>0</sub>= 128
</p>

<table>
<tr>
  <td>R<sub>1</sub></td>
  <td>G<sub>0</sub></td>
  <td>B<sub>0</sub></td>
  <td>Level 2 Cells</td>
</tr>
</table>

<p>
where,
<br>
R<sub>1</sub>= R<sub>0</sub> + (R<sub>0</sub> - B<sub>0</sub>) / 8,<br>G<sub>0</sub>= 128,<br>B<sub>0</sub>= 128
</p>

