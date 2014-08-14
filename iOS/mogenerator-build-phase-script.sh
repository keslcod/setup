PATH_TO_MODELD="Model.xcdatamodeld"

OUTPUT_PATH_MACHINE="Target/Model/Generated/"
OUTPUT_PATH_HUMAN="Target/Model/"

MOGENERATOR="/usr/local/bin/mogenerator"

BASE_MODEL_CLASS="KSLManagedObject"

type $MOGENERATOR >/dev/null 2>&1 || {
    echo >&2 "warning: mogenerator not found. You will need it when changing core data model";
    exit 0;
}

CURRENT_VERSION=$(/usr/libexec/PlistBuddy -c "Print :_XCCurrentVersionName" "${PATH_TO_MODELD}/.xccurrentversion")

MODEL_PATH="${PATH_TO_MODELD}/${CURRENT_VERSION}"
echo "Used model path ${MODEL_PATH}"

$MOGENERATOR -m "${MODEL_PATH}" --base-class BASE_MODEL_CLASS --machine-dir "${OUTPUT_PATH_MACHINE}" --human-dir "${OUTPUT_PATH_HUMAN}" --template-var arc=true
