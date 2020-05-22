# Game of Set
We implemented GUI using Ruby Shoes. You cannot run the ruby file (Set.rb) through the terminal; you can only run it through the Shoes software which can be downloaded and installed from the Ruby Shoes website: http://shoesrb.com/downloads/. Afterward download is complete, it can be installed on Linux using the instructions found here: https://askubuntu.com/questions/650638/how-to-install-shoes-gui-framework-for-ruby-install-file. Then, opening the Shoes app, you can 'run an app' and select the ````/Set/Shoes.rb```` file to run.

### Roles
* Overall Project Manager: Juhee Park
* Coding Manager: Jasmohan Bawa
* Testing Manager: Daniel Lim
* Documentation: Lang Xu

### Contributions
Jasmohan Bawa: Create an agile board for the team, define SetGame class, implement method for checking if 3 cards are a set, added statistics functionality for time per game.

Ern Chi Khoo: Define the Card and Deck class, hint generator functionality

Daniel Lim: Implement method for checking if a deck of cards contains a possible set, implement timer, and implemented the Board class.

Juhee Park: Implement ALL of the GUI and logic behind connecting all classes to make a working game.

Lang Xu: Implement Board class, color blind mode.

Each member completed test files for their own code, but was checked by the entire group for accuracy and bias.

At the end, after merges, we fixed bugs and moved classes and code to different files where appropriate, together as a group.

### Helpful tips

If you would like to test full functionality by finding only one set (as opposed to ALL sets), change ````unless find_set(@board.board)```` to ````unless !find_set(@board.board)```` on line 125 in ````Set/SetGame.rb````. This will cause the game to end after finding just one set.

Test Files were written with the following convention: ````fl_fileName_spec.rb````, where f is the first initial of the creator, l is the last initial of the creator, and fileName is the file name given by the creator.

All rspec test cases for functionality are in the ````spec```` folder. The GUI test plan documentation is located in ````testing```` and is called ````jp_testPlan_GUI````
