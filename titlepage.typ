// ===== Functions for TITLE PAGE and COMPACT TITLE ===============

// -- Abstract Function: `abstract` ----------------------

#let abstract-function(
  title: "Abstract",
  body: none,
  keywords: (),
  compact-mode: false,
) = {
  if(not compact-mode) {
    pagebreak()
  }
  if(title != none and not compact-mode) {
    heading(outlined: false, level: 1, numbering: none)[
      #title
    ]
  }

  body 
  linebreak()
  box(height: 14pt)

  if (keywords != ()) {
    strong("Keywords:")
    for word in keywords {
      if(word != keywords.last()) {
        text(" " + word + ",")
      } else {
        text(" " + word)
      }
    }
  }

  if(not compact-mode) {
    pagebreak()
  }
}

// ===== TITLE PAGE: `titlepage` ====================

#let titlepage(
  doc-category,
  doc-title,
  title-size,
  author,
  affiliation,
  first-examiner,
  second-examiner,
  logo,
  heading-font,             // the heading-font is also used for all text on the titlepage
  heading-color,            // heading-color applies as well for the title
  info-size,                // used throughout the document for "info text"
) = {

  // ----- Page-Setup ------------------------
  set page(
    paper: "a4",
    margin: (top: 3cm, left: 3cm, right: 3cm, bottom: 4.5cm),
  )

  // Some basic rules for the title page layout:
  // - logo is right-justified
  // - all other elements are left-justified
  // - the page uses a grid of 1.5 cm units

  // ----- Logo ------------------------
  place(top + right,        // `place` so that the remaining layout is independent of the size of the logo
    logo,
  )

  v(6cm)                    // = 4 x 1.5 cm

  // ----- Title Category & Title ------------------------
  align(
    left,                   // 1 x 14pt + 2 x 36pt ≈ 2 x 1.5 cm
    text(font: heading-font, weight: "regular", size: 14pt, 
      doc-category),
  )

  text(font: heading-font, weight: "light", size: title-size,  fill: heading-color,
    doc-title,
  )

  // ----- Info Block ------------------------
  set par(leading: 1em)  
  
  place(
    bottom + left,
    stack(
      dir: ltr,
      spacing: 1fr,
      text(
      font: heading-font, weight: "regular", size: info-size, fill: black,
      datetime.today().display("[day].[month].[year]") + str("\n") + 
      author + str("\n") + 
      affiliation),
      text(
        font: heading-font, weight: "regular", size: info-size, fill: black,
        strong("Supervisor") + str("\n") +
        first-examiner + str("\n") +
        strong("Second Reader") + str("\n") +
        second-examiner
      )
    )
  )

}

// ===== COMPACT TITLE: `compact-title` ====================

#let compact-title(
  doc-category,
  doc-title,
  author,
  affiliation,
  logo,
  abstract: none,
  heading-font,             // the heading-font is also used for all text on the titlepage
  heading-color,            // heading-color applies as well for the title
  info-size,                // used throughout the document for "info text"
  body-size,
  label-size,
) = {
  stack(
      v(1.5cm - 0.6cm),     // 3.6cm top-margin -0.6cm + 1.5cm = 4.5cm 
      box(height: 1.5cm, 
        text(font: heading-font, size: 1 * body-size, 
          top-edge: "ascender",
          doc-category) ),
      box(height: 2cm,
        par(leading: 0.5em,
          text(font: heading-font, weight: "bold",
            size: 2 * body-size, fill: luma(40%).mix(heading-color),
            top-edge: "ascender",
            hyphenate: false,
                doc-title) + "\n\n") +
        text(font: heading-font, size: label-size,
          author + "\n" + 
          affiliation + ", " + 
          datetime.today().display("[day].[month].[year]")
        )  
      ),
      v(4cm),
      box(
        abstract-function(
        title: "Abstract",
        body: abstract.body,
        keywords: abstract.keywords,
        compact-mode: true,
      ) 
      )     
    )
}