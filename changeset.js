const fs = require('fs');


const createChangeSet = () => {
    const message = `---
"@monorepopb/${process.env.LIBS}": ${process.env.VERSIONING}
---
    
${process.env.DESCRIPTION}.`

    fs.writeFileSync('./.changeset/changeset.md',message);   
}

module.exports = {
    createChangeSet,
  };
  
