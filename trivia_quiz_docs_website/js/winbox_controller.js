let box_color =   "#000000";
let _html_1 = "winbox_html_page_data.html"
let html_1 = "<div id='winbox_bounding'> <h1 id='winbox_text'>JSON File Editing</h1 id='winbox_text'><p  id='winbox_text'>JSON is a data format that is not dependent on any language. It could be described as a tiny, text based, way to organize[format] and share data. <br><br> JSON can be edited with just about any text editor like NotePad, or code-editor like Atom. </p> <a target='_blank' href='https://atom.io/'><h4 id='winbox_linktext'>Download Atom</h4></a> <img width='700px' src='./img/documentation/categories/json_categories_file.png'></></div>"
let html_2 = "<div id='winbox_bounding'><h1 id='winbox_text'> Add/Edit Categories </h1 ><p id='winbox_text'>The main JSON files can be found in the projects[data] directory. Locate the 'Categories' JSON file and open it.</p><img src='./img/documentation/categories/json_files_folder.png'><p id='winbox_text'>Categories are organized in a single dictionary [notice the category index-count starts at 0], each requires a name and image file path</p><img width='700px' src='./img/documentation/categories/json_categories_file_editing.png'><p id='winbox_text'>Category image files can be added to the Assets/images/category_images directory in Godot</p><br><img src='./img/documentation/categories/json_categories_godot_images_folder.png'></div>"
let html_3 = "<div id='winbox_bounding'> <h1 id='winbox_text'>Sebo Bounce v.1</h1> <a href='https://gotm.io/rustyraygun/sebo'><h3 id='winbox_linktext'>PLAY</h3></a> <img src='./images/homepage/sebo.jpg'></></div>"

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
            title: "[Game] Sebo Bounce v.1",
            html: html_3,
            background: box_color,
            height: "100%",
        });
    }
}

