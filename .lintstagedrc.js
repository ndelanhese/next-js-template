const path = require("path");

const handleBuildEslintCommand = (filenames) =>
  `next lint --fix --file ${filenames
    .map((f) => path.relative(process.cwd(), f))
    .join(" --file ")}`;

module.exports = {
  "*.{js,ts,tsx}": [
    "prettier --write",
    "eslint --fix",
    handleBuildEslintCommand,
  ],
};
