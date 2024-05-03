# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)

    version1 = version1.split('.')
    version1.map!(&:to_i)
    version2 = version2.split('.')
    version2.map!(&:to_i)

    while version1.size < version2.size do
        version1.append(0)
    end
    while version2.size < version1.size do
        version2.append(0)
    end

    version1 <=> version2
end
