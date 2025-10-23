// SPDX-License-Identifier: MIT

pragma solidity 0.8;

// create a twitter contract
// create a mapping between user and tweet
// add a create tweet function to it and store the tweet in the mapping
// create a function to get tweets

contract Twitter {
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 constant MAX_TWEET_LENGTH = 280;

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet( uint _i) public view returns(Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns(Tweet[] memory) {
        return tweets[_owner];
    }
}