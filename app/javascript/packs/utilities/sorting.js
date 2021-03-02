export default class Sort {
  constructor(control){
    this.control = control

    this.setup()
}

  sortRowsByTitle() {
    let table = document.querySelector('table')

    let rows = table.querySelectorAll('tr')
    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    let arrowUp = table.querySelector('.octicon-arrow-up')
    let arrowDown = table.querySelector('.octicon-arrow-down')
    if (arrowUp.classList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      arrowUp.classList.remove('hide')
      arrowDown.classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      arrowDown.classList.remove('hide')
      arrowUp.classList.add('hide')
    }

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
  }

   compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

   compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }

  setup() {
    this.control.addEventListener('click', event => {
      this.sortRowsByTitle()
    })
  }
}
