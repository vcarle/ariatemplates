/*
 * Copyright 2016 Amadeus s.a.s.
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
	$classpath: 'test.aria.widgets.wai.processingIndicator.Tpl',
	$hasScript: true,
	$css: ['test.aria.widgets.wai.processingIndicator.CSS']
}}

{macro main()}
	{@aria:Button {
		id: this.data.elements.toggleDivOverlay.id,
		label: this.data.elements.toggleDivOverlay.content,
		onclick: {
			fn: this.setOverlayOnDiv,
			scope: this
		}
	}/}
	{@aria:Button {
		id: this.data.elements.toggleSectionOverlay.id,
		label: this.data.elements.toggleSectionOverlay.content,
		onclick: {
			fn: this.setOverlayOnSection,
			scope: this
		}
	}/}


	<div class='user_focus' tabindex='0' id='${this.data.elements.before.id}'>${this.data.elements.before.content}</div>

	<div class='container' {id this.data.elements.div.id /}>${this.data.elements.div.content}</div>

	{section {
		waiAria: true,
		id: this.data.elements.section.id,
		macro: 'section',
		bindProcessingTo: {
			inside: this.data.elements.section,
			to: 'overlaySet'
		},
		processingLabel: this.data.elements.section.message,
		waiAriaProcessingLabelReadInterval: this.data.readInterval,
		waiAriaProcessingLabelReadOnceFirst: this.data.readOnceFirst,
		attributes: {
			classList: [
				'container'
			]
		}
	}/}
{/macro}

{macro section()}
	${this.data.elements.section.content}
{/macro}

{/Template}
