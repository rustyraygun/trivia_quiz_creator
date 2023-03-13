let box_color =   "#000000";

let html_1 = "<div id='winbox_bounding'> <h1 id='winbox_text'>JSON File Editing</h1 id='winbox_text'><p  id='winbox_text'>JSON is a data format that is not dependent on any language. It could be described as a tiny, text based, way to organize[format] and share data. <br><br> JSON can be edited with just about any text editor like NotePad, or code-editor like Atom. </p> <a target='_blank' href='https://atom.io/'><h4 id='winbox_linktext'>Download Atom</h4></a> <img width='700px' src='./img/documentation/categories/json_categories_file.png'></></div>"
let html_2 = "<div id='winbox_bounding'><h1 id='winbox_text'> Add/Edit Categories </h1 ><p id='winbox_text'>The main JSON files can be found in the projects[data] directory. Locate the 'Categories' JSON file and open it.</p><img src='./img/documentation/categories/json_files_folder.png'><p id='winbox_text'>Categories are organized in a single dictionary [notice the category index-count starts at 0], each requires a name and image file path</p><img width='700px' src='./img/documentation/categories/json_categories_file_editing.png'><p id='winbox_text'>Category image files can be added to the Assets/images/category_images directory in Godot</p><br><img src='./img/documentation/categories/json_categories_godot_images_folder.png'></div>"
let html_3 = "<div id='winbox_bounding'><h1 id='winbox_text'> Add/Edit Questions </h1 ><p id='winbox_text'>In the projects[data] directory, locate the 'Questions' JSON file and open it.</p><img src='./img/documentation/categories/json_files_folder.png'><p id='winbox_text'>Question dictionaries are organized by 'question-type' [Single-Choice, True-False]</p><img width='700px' src='./img/documentation/questions/questions_json.png'><p id='winbox_text'>You can offer players upto 4 answer options. Insert '*hide' or leave the answer-option slot blank [''] to hide an answer option. Set the correct answer by editing the questions 'key' entry.  Question image files can be added to the Assets/images/questions_images directory in Godot</p><br><img src='./img/documentation/questions/hide_answer_btn.png'></div>"
let html_4 = "<div id='winbox_bounding'><h1 id='winbox_text'>Getting Started With Godot [Gameplay Option]</h1 ><p id='winbox_text'>Godot is a open source game development engine, but can be used to created all kinds of applications.</p><p id='winbox_text'>Download Godot and import the Trivia Quiz project files.</p> <a target='_blank' href='godotengine.org/'><p>Download Godot</p></a><br><br><img src='./img/documentation/godot/custom_celebrations6.png'><p id='winbox_text'>Open the 'app_core.tscn' Scene</p><br><p id='winbox_text'>Click on the 'game_config' node to view the main gameplay options in the Inpector window.</p><br><h2 id='winbox_text'><strong>Gameplay Options:</strong></h2><br><p id='winbox_text'>GAME DETAILS [Dictionary] Here you can edit the About, Author, Quiz Name displayed on the Home Screen.</p><br><p id='winbox_text'>QUIZ COMPLETE MESSAGE [String] The text message shown when the quiz is complete.</p><br><p id='winbox_text'>MAIN BACKGROUND IMAGE [Texture] The background image shown on the Home Screen.</p><br><p id='winbox_text'>Upload your image files [jpg, png] to the Assets>Images>General_Images directory.</p><br><img src='./img/documentation/godot/custom_celebrations_images.png'> <p id='winbox_text'>MAIN BACKGROUND IMAGE [Texture] The background image shown on the Home Screen.</p><br><p id='winbox_text'>CUSTOM CELEBRATION [PackedScene] The custom celebration scene used.</p><br><p id='winbox_text'>USE CUSTOM CELEBRATION [Bool] Toggle custom celebrations on/off </p></div>"
let html_5 = "<div id='winbox_bounding'><h1 id='winbox_text'>Custom Celebrations</h1 ><p id='winbox_text'>To create a custom celebration [PackedScene] we need to first duplicate then default fx_box scene. [answesr_fx_box_2.tscn] </p> <p id='winbox_text'>The default fx_box can be found in the Components directory. Components>Fx_Box>answesr_fx_box_2.tscn</p>  <img src='./img/documentation/celebrations/custom_celebrations2_duplicate.png'><br><p id='winbox_text'>Name and save your new scene. ex:'my_custom_celebration.tscn'</p><br><img src='./img/documentation/celebrations/custom_celebrations3_fx_box.png'> <p id='winbox_text'>Open your new file. Click the parent node 'fx_box' to view the inspector. There you will find the option to toggle the default particles on/off.</p><br><p id='winbox_text'>Use the 'custom_fx' node to parent your new custom celebration.</p><br><p id='winbox_text'>EXAMPLE:</p><p id='winbox_text'>We're going to create a simple celebration fx that sends objects towards the players mosuse position, which explode once they get too close.</p><br><img src='./img/documentation/celebrations/custom_celebrations10_my_custom_fx.png'> <p id='winbox_text'>Create a new node2D child under the 'custom_fx' node, rename it to 'points_box'. Add three Position2D children to the new node. </p><p id='winbox_text'>Move each Position2D node to a new position.</p><p id='winbox_text'>You can add a new script to the 'custom_fx' node or edit the one already attached.</p><br><img src='./img/documentation/celebrations/custom_celebrations11.png'><p id='winbox_text'>We need to create a new scene to instance. Create a new scene called 'ball_follower.tscn'</p><br><p id='winbox_text'>Setup the scene like so. [Parent] ball_follower with three children [ 1 Sprite & 2 CPU-particle nodes]</p><br><img src='./img/documentation/celebrations/custom_celebrations12.png'> <p id='winbox_text'>Insert the code above into the new ball_follower.gd script.</p><br><h2 id='winbox_text'>#Code [ball_follower.gd]</h2><br><p id='winbox_text'>This simple script uses 2 variables, Speed and Target.</p><br><p id='winbox_text'>In Physics_Process:</p><p id='winbox_text'>We set the target to the global_mouse position [Vec2].</p><p id='winbox_text'>Interpolate the objects position towards the Target's position using speed * delta</p><p id='winbox_text'>If the objects position is less than or equal to 150, execute the _explode() function and shut-off the objects Physics_Process</p><br><p id='winbox_text'>We use the _explode function to hide the sprite and set the child CPU-particle nodes to emit. </p><img src='./img/documentation/celebrations/custom_celebrations5.png'> <p id='winbox_text'>Add the following function/code snippet 'above to the 'custom_fx' node's script.</p><br><h2 id='winbox_text'>#Code [create_followers()]</h2><p id='winbox_text'>We execute this function in '_ready()'.</p><p id='winbox_text'>It accepts an interger used to determine how many new ball_follower objects to add at each position2D node position</p>"
function show_project(project_num) {
    if (project_num == 1) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[JSON] How to open and edit JSON files",
            html: html_1,
            background: box_color,
            height: "80%",
            
            
        });
    }

    else if (project_num == 2) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[JSON] Edit/Add Categories",
            html: html_2,
            background: box_color,
            height: "80%",
        });
    }

    else if (project_num == 3) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[JSON] Edit/Add Questions",
            html: html_3,
            background: box_color,
            height: "80%",
        });
    }

    else if (project_num == 4) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[GODOT] Using Godot",
            html: html_4,
            background: box_color,
            height: "80%",
        });
    }

    else if (project_num == 5) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[GODOT] Gameplay Options",
            html: html_5,
            background: box_color,
            height: "80%",
        });
    }

    else if (project_num == 6) {
        new WinBox({
            id: "winbox",
            class: "_winbox",
            title: "[GODOT] Create Custom Celebrations",
            html: html_6,
            background: box_color,
            height: "80%",
        });
    }
}

