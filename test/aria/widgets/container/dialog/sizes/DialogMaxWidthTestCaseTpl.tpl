/*
 * Copyright 2012 Amadeus s.a.s.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

{Template {
    $classpath : "test.aria.widgets.container.dialog.sizes.DialogMaxWidthTestCaseTpl"
}}

    {macro main()}

        {@aria:Dialog {
            visible : true,
            macro : "largeContent",
            title: "Very very very very very very very very very very very very long title",
            id : "dialog1",
            maximizable : true,
            center : false,
            xpos : 20,
            ypos : 20,
            maxHeight: 350,
            maxWidth: 400
        }/}

        {@aria:Dialog {
            visible : true,
            macro : "largeContent",
            title: "Normal title",
            id : "dialog2",
            center : false,
            xpos : 450,
            ypos : 20,
            maxHeight: 400,
            maxWidth: 400
        }/}

        {@aria:Dialog {
            visible : true,
            macro : "smallContent",
            title: "Title larger than the content",
            id : "dialog3",
            center : false,
            xpos : 900,
            ypos : 20,
            maxHeight: 400,
            maxWidth: 400
        }/}

        {@aria:Dialog {
            visible : true,
            macro : "smallContent",
            title: "Very very very very very very very very very very very very long title",
            id : "dialog4",
            center : false,
            xpos : 1150,
            ypos : 20,
            maxHeight: 400,
            maxWidth: 400
        }/}

        {@aria:Dialog {
            visible : true,
            macro : "dynamicWidth",
            title: "Normal title",
            bind: {
                title: {
                    to : "title",
                    inside : data
                }
            },
            id : "dialog5",
            center : false,
            xpos : 900,
            ypos : 200,
            maxHeight: 400,
            maxWidth: 400
        }/}

    {/macro}

    {macro largeContent ()}
        <div style="width:700px; height: 3000px">Large dialog content</div>
    {/macro}
    {macro dynamicWidth ()}
        {section {
            macro: "dynamicWidthContent",
            bindRefreshTo: [{
                inside: data,
                to: "width"
            }]
        }/}
    {/macro}
    {macro dynamicWidthContent ()}
        <div style="width:${data.width}px; height: 3000px">Large dialog content</div>
    {/macro}
    {macro smallContent ()}
        <div style="padding: 20px">Dialog content</div>
    {/macro}

{/Template}
