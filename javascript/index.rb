require 'json';
def getBiggestAlgorithm (algorithms)
    algorithms.reduce("size"=>0) {|prev, current| prev["size"] > current["size"] ? prev : current}
end

def getRecommendationsFromJSON
    file = File.read('./recommendations4.json');
    json = JSON.parse(file);
    algorithms = [{
        "name"=> "logs",
        "hasElements"=> true,
        "size"=> json["logs"].length
    },
    {
        "name"=> "content",
        "hasElements"=> true,
        "size"=> json["content"].length
    },
    {
        "name"=> "myad",
        "hasElements"=> true,
        "size"=> json["myad"].length
    }
    ]
    keepSearching = true
    result = []
    algorithmCounter = 0
    counter = 0
    biggestAlgorithm = getBiggestAlgorithm algorithms
    
    while keepSearching do 
        currentAlgorithm = algorithms[algorithmCounter]
        currentAlgorithmData = json[currentAlgorithm["name"]]

        if currentAlgorithm["hasElements"]
            dataElement = currentAlgorithmData[counter]
            if dataElement 
                result.push(dataElement["token"].to_i)
            else
                currentAlgorithm["hasElements"] = false
            end
        end

        algorithmCounter = algorithmCounter + 1
        
        if algorithmCounter == algorithms.length 
            counter = counter + 1
            algorithmCounter = 0
        end 
        if result.length >= 4 or counter >= biggestAlgorithm["size"] 
            keepSearching = false;
        end
    end
    
    puts result
end

getRecommendationsFromJSON