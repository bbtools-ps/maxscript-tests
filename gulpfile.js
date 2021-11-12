var gulp = require("gulp"),
    del = require("del"),
    shell = require("gulp-shell"),
    zip = require("gulp-zip"),
    destinationFolder = "dist",
    sourceFolder = "src",
    projectName = "Test_Scripts",
    projectVersion = "1.0.0";

// 0. Clean the whole dest/ folder
gulp.task("clean", function () {
    return del([destinationFolder + "/**/*"]);
});

// 1. Copy the scripts from sourceFolder to destinationFolder
gulp.task("copy-scripts", function () {
    return gulp
        .src(sourceFolder + "/**/*.ms")
        .pipe(gulp.dest(destinationFolder + "/"));
});

// 2. Encrypt scripts
gulp.task(
    "encrypt-scripts",
    shell.task("3dsmax -U MAXScript encryptScript.ms")
);

// 3. Zip .zxp and .pdf files
gulp.task("zip-project", () =>
    gulp
        .src([destinationFolder + "/" + "*.mse"])
        .pipe(zip(projectName + "_v" + projectVersion + ".zip"))
        .pipe(gulp.dest(destinationFolder))
);

// 4. Clean the whole dest/ folder
gulp.task("remove-old-scripts", function () {
    return del([
        destinationFolder + "/**/*.ms",
        destinationFolder + "/**/*.mse",
    ]);
});

// Default task
gulp.task(
    "default",
    gulp.series(
        "clean",
        "copy-scripts",
        "encrypt-scripts",
        "zip-project",
        "remove-old-scripts"
    )
);
