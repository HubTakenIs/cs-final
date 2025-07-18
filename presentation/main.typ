#import "@preview/typslides:1.2.6": *

// Project configuration
#show: typslides.with(
  ratio: "16-9",
  theme: "bluey",
  font: "Fira Sans",
  link-style: "color",
)

// The front slide is the first slide of your presentation
#front-slide(
  title: "My Project",
  subtitle: [My Note taking application],
  authors: "Hubertas Varanauskas",
  info: [#link("https://github.com/HubTakenIs/cs-final")],
)




// A simple slide
#slide[
  - My academic question changed to `Can a note taking app that implements spaced repetition help students study?`
  - I managed to complete the literature review
  - Designed and created an application to attempt an experiment
  - I hosted my application at #link("https://hubv.co.uk")
  - I didn't manage to do the experiment because of time constraints.

]

#slide[
  - In my literature review I have identified a few key gaps in research:
    - Current note taking application do not incorporate revision strategies or spaced repetition
    - Note quality is more important than quantity but note taking apps do not incorporate strategies to help students take better notes
    - Note taking apps do not encourage/ motivate

]

#title-slide[
  Any questions?
]
