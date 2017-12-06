#ifndef WRAPPER_H
#define WRAPPER_H

#include "keyfinder.h"

#define LIBKEYFINDER_API __declspec(dllexport)

extern "C"
{
	LIBKEYFINDER_API KeyFinder::Workspace* new_workspace();

	LIBKEYFINDER_API void delete_workspace(
		KeyFinder::Workspace* workspace);

	LIBKEYFINDER_API KeyFinder::KeyFinder* new_keyfinder();

	LIBKEYFINDER_API void delete_keyfinder(
		KeyFinder::KeyFinder* key_finder);

	LIBKEYFINDER_API void keyfinder_progressive_chromagram(
		KeyFinder::KeyFinder* key_finder,
		KeyFinder::AudioData* audio_data,
		KeyFinder::Workspace* workspace);

	LIBKEYFINDER_API KeyFinder::key_t keyfinder_key_of_chromagram(
		KeyFinder::KeyFinder* key_finder,
		KeyFinder::Workspace* workspace);

	LIBKEYFINDER_API void keyfinder_final_chromagram(
		KeyFinder::KeyFinder* key_finder,
		KeyFinder::Workspace* workspace);

	LIBKEYFINDER_API KeyFinder::AudioData* new_audio_data(
		const unsigned frame_rate,
		const unsigned channels,
		const unsigned samples);

	LIBKEYFINDER_API void delete_audio_data(
		KeyFinder::AudioData* audio_data);

	LIBKEYFINDER_API void audio_data_set_sample(
		KeyFinder::AudioData* audio_data,
		const unsigned index,
		const double value);
}

#endif
