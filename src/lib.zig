const std = @import("std");
const hasEnv = std.process.hasEnvVarConstant;

pub const CI = enum {
    gerrit,
    azure_pipelines,
    bitrise,
    buddy,
    buildkite,
    cirrus,
    gitlab,
    appveyor,
    circle_ci,
    semaphore,
    drone,
    dsari,
    github_actions,
    tddium,
    strider,
    taskcluster,
    jenkins,
    bamboo,
    gocd,
    hudson,
    wercker,
    netlify,
    now_github,
    now_gitlab,
    now_bitbucket,
    bitbucket_pipelines,
    now,
    vercel_github,
    vercel_gitlab,
    vercel_bitbucket,
    vercel,
    magnum,
    nevercode,
    render,
    sail,
    shippable,
    teamcity,
    custom,
    heroku,
    travis_ci,
    aws_codebuild,
    google_cloud_build,
};

pub fn detect() ?CI {
    if (hasEnv("GERRIT_PROJECT")) return .gerrit;
    if (hasEnv("SYSTEM_TEAMFOUNDATIONCOLLECTIONURI")) return .azure_pipelines;
    if (hasEnv("BITRISE_IO")) return .bitrise;
    if (hasEnv("BUDDY_WORKSPACE_ID")) return .buddy;
    if (hasEnv("BUILDKITE")) return .buildkite;
    if (hasEnv("CIRRUS_CI")) return .cirrus;
    if (hasEnv("GITLAB_CI")) return .gitlab;
    if (hasEnv("APPVEYOR")) return .appveyor;
    if (hasEnv("CIRCLECI")) return .circle_ci;
    if (hasEnv("SEMAPHORE")) return .semaphore;
    if (hasEnv("DRONE")) return .drone;
    if (hasEnv("DSARI")) return .dsari;
    if (hasEnv("GITHUB_ACTION")) return .github_actions;
    if (hasEnv("TDDIUM")) return .tddium;
    if (hasEnv("STRIDER")) return .strider;
    if (hasEnv("TASKCLUSTER_ROOT_URL")) return .taskcluster;
    if (hasEnv("JENKINS_URL")) return .jenkins;
    if (hasEnv("bamboo.buildKey")) return .bamboo;
    if (hasEnv("GO_PIPELINE_NAME")) return .gocd;
    if (hasEnv("HUDSON_URL")) return .hudson;
    if (hasEnv("WERCKER")) return .wercker;
    if (hasEnv("NETLIFY")) return .netlify;
    if (hasEnv("NOW_GITHUB_DEPLOYMENT")) return .now_github;
    if (hasEnv("GITLAB_DEPLOYMENT")) return .now_gitlab; // TODO should this prefixed with NOW_ ?
    if (hasEnv("BITBUCKET_DEPLOYMENT")) return .now_bitbucket; // TODO should this be prefixed with NOW_ ?
    if (hasEnv("BITBUCKET_BUILD_NUMBER")) return .bitbucket_pipelines;
    if (hasEnv("NOW_BUILDER")) return .now;
    if (hasEnv("VERCEL_GITHUB_DEPLOYMENT")) return .vercel_github;
    if (hasEnv("VERCEL_GITLAB_DEPLOYMENT")) return .vercel_gitlab;
    if (hasEnv("VERCEL_BITBUCKET_DEPLOYMENT")) return .vercel_bitbucket;
    if (hasEnv("VERCEL")) return .vercel;
    if (hasEnv("MAGNUM")) return .magnum;
    if (hasEnv("NEVERCODE")) return .nevercode;
    if (hasEnv("RENDER")) return .render;
    if (hasEnv("SAIL_CI")) return .sail;
    if (hasEnv("SHIPPABLE")) return .shippable;
    if (hasEnv("TEAMCITY_VERSION")) return .teamcity;
    if (hasEnv("CI_NAME")) return .custom;
    // TODO this would likely mean we need an allocator in the method :/
    // heroku doesn't set envs other than node in a heroku_specific location
    // : /\/\.heroku\/node\/bin\/node$/.test(process.env.NODE || '') ? 'heroku'
    if (hasEnv("TRAVIS")) return .travis_ci;
    if (hasEnv("CODEBUILD_SRC_DIR")) return .aws_codebuild;
    if (hasEnv("CI")) return .custom;
    if (hasEnv("BUILDER_OUTPUT")) return .google_cloud_build;
    return null;
}
