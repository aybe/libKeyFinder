
#include "wrapper.h"

KeyFinder::Workspace* new_workspace()
{
	return new KeyFinder::Workspace();
}

void delete_workspace(KeyFinder::Workspace* workspace)
{
	delete workspace;
}

KeyFinder::KeyFinder* new_keyfinder()
{
	return new KeyFinder::KeyFinder();
}

void delete_keyfinder(KeyFinder::KeyFinder* key_finder)
{
	delete key_finder;
}

void keyfinder_progressive_chromagram(KeyFinder::KeyFinder* key_finder, KeyFinder::AudioData* audio_data, KeyFinder::Workspace* workspace)
{
	key_finder->progressiveChromagram(*audio_data, *workspace);
}

KeyFinder::key_t keyfinder_key_of_chromagram(KeyFinder::KeyFinder* key_finder, KeyFinder::Workspace* workspace)
{
	return key_finder->keyOfChromagram(*workspace);
}

void keyfinder_final_chromagram(KeyFinder::KeyFinder* key_finder, KeyFinder::Workspace* workspace)
{
	key_finder->finalChromagram(*workspace);
}

KeyFinder::AudioData* new_audio_data(const unsigned frame_rate, const unsigned channels, const unsigned samples)
{
	auto audio_data = new KeyFinder::AudioData();
	audio_data->setFrameRate(frame_rate);
	audio_data->setChannels(channels);
	audio_data->addToSampleCount(samples);
	return audio_data;
}

void delete_audio_data(KeyFinder::AudioData* audio_data)
{
	delete audio_data;
}

void audio_data_set_sample(KeyFinder::AudioData* audio_data, const unsigned index, const double value)
{
	audio_data->setSample(index, value);
}

